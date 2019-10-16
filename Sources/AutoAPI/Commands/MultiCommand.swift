//
// AutoAPI
// Copyright (C) 2019 High-Mobility GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//
// Please inquire about commercial licensing options at
// licensing@high-mobility.com
//
//
//  MultiCommand.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 14/11/2018.
//  Copyright © 2019 High Mobility. All rights reserved.
//

import Foundation


public struct MultiCommand: InboundCommand, OutboundCommand {

    public let states: [VehicleState]?


    // MARK: InboundCommand

    public let properties: Properties


    init?(_ messageType: UInt8, properties: Properties) {
        guard messageType == MultiCommand.MessageTypes.states.rawValue else {
            return nil
        }

        let stateTypes = AAAutoAPI.commands.compactMap { $0 as? VehicleStateType.Type }


        states = properties.flatMap(for: 0x01) { property in
            stateTypes.flatMapFirst { $0.init(property.value) }
        }

        // Properties
        self.properties = properties
    }
}

extension MultiCommand: Identifiable {

    public static var identifier: Identifier = 0x0013
}

extension MultiCommand: MessageTypesGettable {

    public enum MessageTypes: UInt8, MessageTypesKind {

        case states = 0x01
        case send   = 0x02


        public static var all: [MultiCommand.MessageTypes] {
            return [self.send]
        }
    }
}

public extension MultiCommand {

    static func combined(_ commands: [UInt8]...) -> [UInt8] {
        let wrappedCommands = commands.map { CommandWrapper(value: $0) }

        return commandPrefix(for: .send) + wrappedCommands.flatMap { $0.propertyBytes(0x01) }
    }
}
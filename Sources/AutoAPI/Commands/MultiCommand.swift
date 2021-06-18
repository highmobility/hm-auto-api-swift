//
//  The MIT License
//
//  Copyright (c) 2014- High-Mobility GmbH (https://high-mobility.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//
//  MultiCommand.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 14/11/2018.
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
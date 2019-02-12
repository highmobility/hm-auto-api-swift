//
// AutoAPI
// Copyright (C) 2018 High-Mobility GmbH
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
//  AAEngine.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 28/11/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AAEngine: AAFullStandardCommand {

    public let accessoriesPoweredState: AAProperty<AAActiveState>?
    public let engineState: AAProperty<AAActiveState>?
    public let ignitionState: AAProperty<AAActiveState>?


    // MARK: AAFullStandardCommand

    public let properties: AAProperties


    init?(properties: AAProperties) {
        // Ordered by the ID
        ignitionState = properties.property(for: \AAEngine.ignitionState)
        accessoriesPoweredState = properties.property(for: \AAEngine.accessoriesPoweredState)
        engineState = properties.property(for: \AAEngine.engineState)

        // Properties
        self.properties = properties
    }
}

extension AAEngine: AAIdentifiable {

    public static var identifier: AACommandIdentifier = 0x0035
}

extension AAEngine: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getEngineState = 0x00
        case engineState    = 0x01
        case turnOnOff      = 0x12
    }
}

extension AAEngine: AAPropertyIdentifierGettable {

    static func propertyID<Type>(for keyPath: KeyPath<AAEngine, Type>) -> AAPropertyIdentifier? {
        switch keyPath {
        case \AAEngine.ignitionState:           return 0x01
        case \AAEngine.accessoriesPoweredState: return 0x02
        case \AAEngine.engineState:             return 0x03

        default:
            return nil
        }
    }
}

public extension AAEngine {

    static var getEngineState: [UInt8] {
        return commandPrefix(for: .getEngineState)
    }


    static func turnIgnitionOnOff(_ state: AAActiveState) -> [UInt8] {
        return commandPrefix(for: .turnOnOff) + state.propertyBytes(0x01)
    }
}

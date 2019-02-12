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
//  AADashboardLights.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 24/04/2018.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AADashboardLights: AAFullStandardCommand {

    public let lights: [AAProperty<AADashboardLight>]?


    // MARK: AAFullStandardCommand

    public let properties: AAProperties


    init?(properties: AAProperties) {
        // Ordered by the ID
        lights = properties.properties(for: \AADashboardLights.lights) 

        // Properties
        self.properties = properties
    }
}

extension AADashboardLights: AAIdentifiable {

    public static var identifier: AACommandIdentifier = 0x0061
}

extension AADashboardLights: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getDashboardLights = 0x00
        case dashboardLights    = 0x01
    }
}

extension AADashboardLights: AAPropertyIdentifierGettable {

    static func propertyID<Type>(for keyPath: KeyPath<AADashboardLights, Type>) -> AAPropertyIdentifier? {
        switch keyPath {
        case \AADashboardLights.lights: return 0x01

        default:
            return nil
        }
    }
}

public extension AADashboardLights {

    static var getDashboardLights: [UInt8] {
        return commandPrefix(for: .getDashboardLights)
    }
}

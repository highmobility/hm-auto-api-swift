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
//  AAChassisSettings.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 13/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AAChassisSettings: AAFullStandardCommand {

    public let currentChassisPosition: AAProperty<UInt8>?
    public let currentSpringRates: [AAProperty<AASpringRateValue>]?
    public let drivingMode: AAProperty<AADrivingMode>?
    public let maximumChassisPosition: AAProperty<Int8>?
    public let maximumSpringRates: [AAProperty<AASpringRateValue>]?
    public let minimumChassisPosition: AAProperty<Int8>?
    public let minimumSpringRates: [AAProperty<AASpringRateValue>]?
    public let sportChronoState: AAProperty<AAActiveState>?


    // MARK: AAFullStandardCommand

    public let properties: AAProperties


    init?(properties: AAProperties) {
        // Ordered by the ID
        drivingMode = properties.property(for: \AAChassisSettings.drivingMode)
        sportChronoState = properties.property(for: \AAChassisSettings.sportChronoState)
        /* Level 8 */
        currentSpringRates = properties.properties(for: \AAChassisSettings.currentSpringRates)
        maximumSpringRates = properties.properties(for: \AAChassisSettings.maximumSpringRates)
        minimumSpringRates = properties.properties(for: \AAChassisSettings.minimumSpringRates)
        currentChassisPosition = properties.property(for: \AAChassisSettings.currentChassisPosition)
        maximumChassisPosition = properties.property(for: \AAChassisSettings.maximumChassisPosition)
        minimumChassisPosition = properties.property(for: \AAChassisSettings.minimumChassisPosition)

        // Properties
        self.properties = properties
    }
}

extension AAChassisSettings: AAIdentifiable {

    public static var identifier: AACommandIdentifier = 0x0053
}

extension AAChassisSettings: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getChassisSettings     = 0x00
        case chassisSettings        = 0x01
        case setDrivingMode         = 0x12
        case startStopSportChrono   = 0x13
        case setSpringRates         = 0x14
        case setChassisPosition     = 0x15
    }
}

extension AAChassisSettings: AAPropertyIdentifierGettable {

    static func propertyID<Type>(for keyPath: KeyPath<AAChassisSettings, Type>) -> AAPropertyIdentifier? {
        switch keyPath {
        case \AAChassisSettings.drivingMode:        return 0x01
        case \AAChassisSettings.sportChronoState:   return 0x02
            /* Level 8 */
        case \AAChassisSettings.currentSpringRates:      return 0x05
        case \AAChassisSettings.maximumSpringRates:      return 0x06
        case \AAChassisSettings.minimumSpringRates:      return 0x07
        case \AAChassisSettings.currentChassisPosition:  return 0x08
        case \AAChassisSettings.maximumChassisPosition:  return 0x09
        case \AAChassisSettings.minimumChassisPosition:  return 0x0A

        default:
            return nil
        }
    }
}

public extension AAChassisSettings {

    static var getChassisSettings: [UInt8] {
        return commandPrefix(for: .getChassisSettings)
    }

    static func setChassisPosition(_ position: UInt8) -> [UInt8] {
        return commandPrefix(for: .setChassisPosition) + position.propertyBytes(0x01)
    }

    static func setDrivingMode(_ mode: AADrivingMode) -> [UInt8] {
        return commandPrefix(for: .setDrivingMode) + mode.propertyBytes(0x01)
    }

    static func setSpringRates(_ rates: [AASpringRateValue]) -> [UInt8] {
        return commandPrefix(for: .setSpringRates) + rates.reduceToByteArray { $0.propertyBytes(0x01) }
    }

    static func startStopSportChrono(_ startStop: AAStartStopState) -> [UInt8] {
        return commandPrefix(for: .startStopSportChrono) + startStop.propertyBytes(0x01)
    }
}

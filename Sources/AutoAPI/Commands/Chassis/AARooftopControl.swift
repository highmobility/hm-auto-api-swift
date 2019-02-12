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
//  AARooftopControl.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 01/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AARooftopControl: AAFullStandardCommand {

    public let convertibleRoofState: AAProperty<AAConvertibleRoofState>?
    public let dimming: AAProperty<AAPercentageInt>?
    public let position: AAProperty<AAPercentageInt>?
    public let sunroofTiltState: AAProperty<AATiltState>?
    public let sunroofState: AAProperty<AAPositionState>?


    // MARK: AAFullStandardCommand

    public let properties: AAProperties


    init?(properties: AAProperties) {
        // Ordered by the ID
        dimming = properties.property(for: \AARooftopControl.dimming)
        position = properties.property(for: \AARooftopControl.position)
        /* Level 8 */
        convertibleRoofState = properties.property(for: \AARooftopControl.convertibleRoofState)
        sunroofTiltState = properties.property(for: \AARooftopControl.sunroofTiltState)
        /* Level 9 */
        sunroofState = properties.property(for: \AARooftopControl.sunroofState)

        // Properties
        self.properties = properties
    }
}

extension AARooftopControl: AAIdentifiable {

    public static var identifier: AACommandIdentifier = 0x0025
}

extension AARooftopControl: AAMessageTypesGettable {

    public enum MessageTypes: UInt8, CaseIterable {

        case getRooftopState    = 0x00
        case rooftopState       = 0x01
        case controlRooftop     = 0x12
    }
}

extension AARooftopControl: AAPropertyIdentifierGettable {

    static func propertyID<Type>(for keyPath: KeyPath<AARooftopControl, Type>) -> AAPropertyIdentifier? {
        switch keyPath {
        case \AARooftopControl.dimming:     return 0x01
        case \AARooftopControl.position:    return 0x02
            /* Level 8 */
        case \AARooftopControl.convertibleRoofState:    return 0x03
        case \AARooftopControl.sunroofTiltState:        return 0x04
        case \AARooftopControl.sunroofState:            return 0x05

        default:
            return nil
        }
    }
}

public extension AARooftopControl {

    static var getRooftopState: [UInt8] {
        return commandPrefix(for: .getRooftopState)
    }

    static func controlRooftop(dimming: AAPercentageInt?,
                               open: AAPercentageInt?,
                               convertibleRoof: AAConvertibleRoofState?,
                               sunroofTilt: AATiltState?,
                               sunroofState: AAPositionState?) -> [UInt8] {
        return commandPrefix(for: .controlRooftop) + [dimming?.propertyBytes(0x01),
                                                      open?.propertyBytes(0x02),
                                                      convertibleRoof?.propertyBytes(0x03),
                                                      sunroofTilt?.propertyBytes(0x04),
                                                      sunroofState?.propertyBytes(0x05)].propertiesValuesCombined
    }
}

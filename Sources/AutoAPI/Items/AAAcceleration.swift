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
//  AAAcceleration.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 07/12/2017.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


public struct AAAcceleration {

    public let type: AAAccelerationType
    public let value: Float
}

extension AAAcceleration: AAItem {

    static var size: Int = 5


    init?(bytes: [UInt8]) {
        guard let accelerationType = AAAccelerationType(rawValue: bytes[0]) else {
            return nil
        }

        type = accelerationType
        value = Float(bytes.dropFirstBytes(1))
    }
}

extension AAAcceleration: AAPropertyConvertable {

    var propertyValue: [UInt8] {
        return [type.rawValue] + value.bytes
    }
}

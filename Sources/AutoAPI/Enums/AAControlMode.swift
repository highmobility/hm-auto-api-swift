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
//  AAControlMode.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 12/12/2017.
//  Copyright © 2019 High Mobility GmbH. All rights reserved.
//

import Foundation


public enum AAControlMode: UInt8 {

    case unavailable    = 0x00
    case available      = 0x01
    case started        = 0x02
    case failedToStart  = 0x03
    case aborted        = 0x04
    case ended          = 0x05
}

extension AAControlMode: AABytesConvertable {
    
}

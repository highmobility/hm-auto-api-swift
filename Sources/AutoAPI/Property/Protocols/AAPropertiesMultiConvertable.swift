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
//  AAPropertiesMultiConvertable.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 21/09/2018.
//  Copyright © 2018 High Mobility. All rights reserved.
//

import Foundation


protocol AAPropertiesMultiConvertable {

    var propertiesValues: [[UInt8]?] { get }
    var propertiesValuesCombined: [UInt8] { get }
}

extension AAPropertiesMultiConvertable {

    // TODO: Redo this, currently can be misunderstood
    var propertiesValuesCombined: [UInt8] {
        return propertiesValues.propertiesValuesCombined
    }
}
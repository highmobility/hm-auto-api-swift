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
//  AAPropertyComponents.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 12/02/2019.
//  Copyright © 2019 High Mobility GmbH. All rights reserved.
//

import Foundation


struct AAPropertyComponents: Sequence, IteratorProtocol {

    public var bytes: [UInt8]


    // MARK: IteratorProtocol

    mutating func next() -> AAPropertyComponent? {
        guard bytes.count >= 3 else {
            return nil
        }

        // UInt16 initialiser can't create an invalid value with 2 bytes
        let componentsSize = UInt16(bytes: bytes[1...2])!.int
        let size = 3 + componentsSize

        guard bytes.count >= size,
            let component = AAPropertyComponent(bytes: bytes[..<size]) else {
                return nil
        }

        bytes.removeFirst(size)

        return component
    }
}

extension AAPropertyComponents: AABytesConvertable {

}

extension AAPropertyComponents {

    func component(for type: AAPropertyComponentType) -> AAPropertyComponent? {
        return first { $0.type == type }
    }
}

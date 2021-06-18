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
//  KeyfobPosition.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 12/12/2017.
//

import Foundation


public struct KeyfobPosition: FullStandardCommand {

    public let relativePosition: KeyfobRelativePosition?


    // MARK: FullStandardCommand

    public let properties: Properties


    init?(properties: Properties) {
        // Ordered by the ID
        relativePosition = KeyfobRelativePosition(rawValue: properties.first(for: 0x01)?.monoValue)

        // Properties
        self.properties = properties
    }
}

extension KeyfobPosition: MessageTypesGettable {

    public enum MessageTypes: UInt8, MessageTypesKind {

        case getKeyfobPosition  = 0x00
        case keyfobPosition     = 0x01


        public static var all: [KeyfobPosition.MessageTypes] {
            return [self.getKeyfobPosition,
                    self.keyfobPosition]
        }
    }
}

extension KeyfobPosition: Identifiable {

    public static var identifier: Identifier = Identifier(0x0048)
}

public extension KeyfobPosition {

    static var getKeyfobPosition: [UInt8] {
        return commandPrefix(for: .getKeyfobPosition)
    }
}
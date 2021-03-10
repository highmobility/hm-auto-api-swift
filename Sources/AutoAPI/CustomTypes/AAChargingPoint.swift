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
//  AAChargingPoint.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAChargingPoint: Codable, HMBytesConvertable {

    /// City the charging point is in..
    public var city: String

    /// Postal code the charging point is at..
    public var postalCode: String

    /// Street address the chargin point is at..
    public var street: String

    /// The provider name of the charging point..
    public var provider: String


    /// Initialise `AAChargingPoint` with arguments.
    ///
    /// - parameters:
    ///     - city: City the charging point is in..
    ///     - postalCode: Postal code the charging point is at..
    ///     - street: Street address the chargin point is at..
    ///     - provider: The provider name of the charging point..
    public init(city: String, postalCode: String, street: String, provider: String) {
        self.bytes = [city.bytes.sizeBytes(amount: 2), city.bytes, postalCode.bytes.sizeBytes(amount: 2), postalCode.bytes, street.bytes.sizeBytes(amount: 2), street.bytes, provider.bytes.sizeBytes(amount: 2), provider.bytes].flatMap { $0 }
        self.city = city
        self.postalCode = postalCode
        self.street = street
        self.provider = provider
    }


    // MARK: HMBytesConvertable
    
    public let bytes: [UInt8]
    
    
    /// Initialise `AAChargingPoint` with bytes.
    ///
    /// - parameters:
    ///     - bytes: Bytes array in `[UInt8]`.
    public required init?(bytes: [UInt8]) {
        guard bytes.count >= 0 else {
            return nil
        }
    
        guard let city = bytes.extract(stringFrom: 0),
    		  let postalCode = bytes.extract(stringFrom: (2 + city.bytes.count)),
    		  let street = bytes.extract(stringFrom: (4 + city.bytes.count + postalCode.bytes.count)),
    		  let provider = bytes.extract(stringFrom: (6 + city.bytes.count + postalCode.bytes.count + street.bytes.count)) else {
            return nil
        }
    
        self.bytes = bytes
        self.city = city
        self.postalCode = postalCode
        self.street = street
        self.provider = provider
    }
}

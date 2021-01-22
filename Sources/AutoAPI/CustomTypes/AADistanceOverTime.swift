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
//  AADistanceOverTime.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AADistanceOverTime: Codable, HMBytesConvertable {

    /// Distance driven.
    public var distance: Measurement<UnitLength>

    /// Duration of time for the given distance.
    public var time: Measurement<UnitDuration>


    /// Initialise `AADistanceOverTime` with arguments.
    ///
    /// - parameters:
    ///     - distance: Distance driven.
    ///     - time: Duration of time for the given distance.
    public init(distance: Measurement<UnitLength>, time: Measurement<UnitDuration>) {
        self.bytes = [distance.bytes, time.bytes].flatMap { $0 }
        self.distance = distance
        self.time = time
    }


    // MARK: HMBytesConvertable
    
    public let bytes: [UInt8]
    
    
    /// Initialise `AADistanceOverTime` with bytes.
    ///
    /// - parameters:
    ///     - bytes: Bytes array in `[UInt8]`.
    public required init?(bytes: [UInt8]) {
        guard bytes.count == 20 else {
            return nil
        }
    
        guard let distance = Measurement<UnitLength>(bytes: bytes[0..<(0 + 10)].bytes),
    		  let time = Measurement<UnitDuration>(bytes: bytes[10..<(10 + 10)].bytes) else {
            return nil
        }
    
        self.bytes = bytes
        self.distance = distance
        self.time = time
    }
}

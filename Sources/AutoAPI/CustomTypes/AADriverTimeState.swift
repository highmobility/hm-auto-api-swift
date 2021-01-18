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
//  AADriverTimeState.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AADriverTimeState: Codable, HMBytesConvertable {

    /// TimeState enum.
    public enum TimeState: UInt8, CaseIterable, Codable, HMBytesConvertable {
        case normal = 0x00
        case fifteenMinBeforeFour = 0x01
        case fourReached = 0x02
        case fifteenMinBeforeNine = 0x03
        case nineReached = 0x04
        case fifteenMinBeforeSixteen = 0x05
        case sixteenReached = 0x06
    }


    /// The driver number.
    public var driverNumber: UInt8

    /// TimeState.
    public var timeState: TimeState


    /// Initialise `AADriverTimeState` with arguments.
    ///
    /// - parameters:
    ///     - driverNumber: The driver number.
    ///     - timeState: TimeState.
    public init(driverNumber: UInt8, timeState: TimeState) {
        self.bytes = [driverNumber.bytes, timeState.bytes].flatMap { $0 }
        self.driverNumber = driverNumber
        self.timeState = timeState
    }


    // MARK: HMBytesConvertable
    
    public let bytes: [UInt8]
    
    
    /// Initialise `AADriverTimeState` with bytes.
    ///
    /// - parameters:
    ///     - bytes: Bytes array in `[UInt8]`.
    public required init?(bytes: [UInt8]) {
        guard bytes.count == 2 else {
            return nil
        }
    
        guard let driverNumber = UInt8(bytes: bytes[0..<1].bytes),
    		  let timeState = TimeState(bytes: bytes[1..<2].bytes) else {
            return nil
        }
    
        self.bytes = bytes
        self.driverNumber = driverNumber
        self.timeState = timeState
    }
}
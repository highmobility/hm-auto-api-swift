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
//  AACrashImpactZone.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


/// Impact zone of the crash.
public enum AACrashImpactZone: String, CaseIterable, Codable, HMBytesConvertable {

    case frontDriverSide
    case frontPassengerSide
    case predestrianProtection
    case rearDriverSide
    case rearPassengerSide
    case rollover
    case sideDriverSide
    case sidePassegerSide


    public var byteValue: UInt8 {
        switch self {
        case .predestrianProtection: return 0x00
        case .rollover: return 0x01
        case .rearPassengerSide: return 0x02
        case .rearDriverSide: return 0x03
        case .sidePassegerSide: return 0x04
        case .sideDriverSide: return 0x05
        case .frontPassengerSide: return 0x06
        case .frontDriverSide: return 0x07
        }
    }


    // MARK: HMBytesConvertable

    public var bytes: [UInt8] {
        [byteValue]
    }


    public init?(bytes: [UInt8]) {
        guard let uint8 = UInt8(bytes: bytes) else {
            return nil
        }

        switch uint8 {
        case 0x00: self = .predestrianProtection
        case 0x01: self = .rollover
        case 0x02: self = .rearPassengerSide
        case 0x03: self = .rearDriverSide
        case 0x04: self = .sidePassegerSide
        case 0x05: self = .sideDriverSide
        case 0x06: self = .frontPassengerSide
        case 0x07: self = .frontDriverSide
        default: return nil
        }
    }
}
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
//  AAChargingStatus.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


/// Status.
public enum AAChargingStatus: String, CaseIterable, Codable, HMBytesConvertable {

    case cableUnplugged
    case charging
    case chargingComplete
    case chargingError
    case chargingPaused
    case discharging
    case fastCharging
    case foreignObjectDetected
    case initialising
    case notCharging
    case slowCharging


    public var byteValue: UInt8 {
        switch self {
        case .notCharging: return 0x00
        case .charging: return 0x01
        case .chargingComplete: return 0x02
        case .initialising: return 0x03
        case .chargingPaused: return 0x04
        case .chargingError: return 0x05
        case .cableUnplugged: return 0x06
        case .slowCharging: return 0x07
        case .fastCharging: return 0x08
        case .discharging: return 0x09
        case .foreignObjectDetected: return 0x0a
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
        case 0x00: self = .notCharging
        case 0x01: self = .charging
        case 0x02: self = .chargingComplete
        case 0x03: self = .initialising
        case 0x04: self = .chargingPaused
        case 0x05: self = .chargingError
        case 0x06: self = .cableUnplugged
        case 0x07: self = .slowCharging
        case 0x08: self = .fastCharging
        case 0x09: self = .discharging
        case 0x0a: self = .foreignObjectDetected
        default: return nil
        }
    }
}

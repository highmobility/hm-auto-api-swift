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
//  AADashboardLightsBulbFailures.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


/// Vehicle light bulb failure.
public enum AADashboardLightsBulbFailures: String, CaseIterable, Codable, HMBytesConvertable {

    case dayRunning
    case fogLightFront
    case fogLightRear
    case highBeam
    case highBeamLeft
    case highBeamRight
    case lowBeam
    case lowBeamLeft
    case lowBeamRight
    case multiple
    case position
    case stop
    case trailerElectricalFailure
    case trailerStop
    case trailerTurn
    case trailerTurnLeft
    case trailerTurnRight
    case turnSignalLeft
    case turnSignalRight


    public var byteValue: UInt8 {
        switch self {
        case .turnSignalLeft: return 0x00
        case .turnSignalRight: return 0x01
        case .lowBeam: return 0x02
        case .lowBeamLeft: return 0x03
        case .lowBeamRight: return 0x04
        case .highBeam: return 0x05
        case .highBeamLeft: return 0x06
        case .highBeamRight: return 0x07
        case .fogLightFront: return 0x08
        case .fogLightRear: return 0x09
        case .stop: return 0x0a
        case .position: return 0x0b
        case .dayRunning: return 0x0c
        case .trailerTurn: return 0x0d
        case .trailerTurnLeft: return 0x0e
        case .trailerTurnRight: return 0x0f
        case .trailerStop: return 0x10
        case .trailerElectricalFailure: return 0x11
        case .multiple: return 0x12
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
        case 0x00: self = .turnSignalLeft
        case 0x01: self = .turnSignalRight
        case 0x02: self = .lowBeam
        case 0x03: self = .lowBeamLeft
        case 0x04: self = .lowBeamRight
        case 0x05: self = .highBeam
        case 0x06: self = .highBeamLeft
        case 0x07: self = .highBeamRight
        case 0x08: self = .fogLightFront
        case 0x09: self = .fogLightRear
        case 0x0a: self = .stop
        case 0x0b: self = .position
        case 0x0c: self = .dayRunning
        case 0x0d: self = .trailerTurn
        case 0x0e: self = .trailerTurnLeft
        case 0x0f: self = .trailerTurnRight
        case 0x10: self = .trailerStop
        case 0x11: self = .trailerElectricalFailure
        case 0x12: self = .multiple
        default: return nil
        }
    }
}
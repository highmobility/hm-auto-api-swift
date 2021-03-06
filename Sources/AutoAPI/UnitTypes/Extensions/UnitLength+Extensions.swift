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
//  UnitLength+Extensions.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation


extension UnitLength: AAUnitType {

    public static let measurementID: UInt8 = 0x12

    public static func create(id: UInt8) -> Self? {
        switch id {
        case 0x00:  return UnitLength.meters as? Self
        case 0x01:  return UnitLength.millimeters as? Self
        case 0x02:  return UnitLength.centimeters as? Self
        case 0x03:  return UnitLength.decimeters as? Self
        case 0x04:  return UnitLength.kilometers as? Self
        case 0x05:  return UnitLength.megameters as? Self
        case 0x0b:  return UnitLength.inches as? Self
        case 0x0c:  return UnitLength.feet as? Self
        case 0x0d:  return UnitLength.yards as? Self
        case 0x0e:  return UnitLength.miles as? Self
        case 0x0f:  return UnitLength.scandinavianMiles as? Self
        case 0x11:  return UnitLength.nauticalMiles as? Self

        default:    return nil
        }
    }


    public var identifiers: [UInt8]? {
        switch self {
        case .meters: return [Self.measurementID, 0x00]
        case .millimeters: return [Self.measurementID, 0x01]
        case .centimeters: return [Self.measurementID, 0x02]
        case .decimeters: return [Self.measurementID, 0x03]
        case .kilometers: return [Self.measurementID, 0x04]
        case .megameters: return [Self.measurementID, 0x05]
        case .inches: return [Self.measurementID, 0x0b]
        case .feet: return [Self.measurementID, 0x0c]
        case .yards: return [Self.measurementID, 0x0d]
        case .miles: return [Self.measurementID, 0x0e]
        case .scandinavianMiles: return [Self.measurementID, 0x0f]
        case .nauticalMiles: return [Self.measurementID, 0x11]

        default: return nil
        }
    }
}

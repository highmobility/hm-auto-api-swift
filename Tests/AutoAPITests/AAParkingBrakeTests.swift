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
//  AAParkingBrakeTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAParkingBrakeTests: XCTestCase {

    // MARK: State Properties
    
    func testStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x58, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAParkingBrake else {
            return XCTFail("Could not parse bytes as `AAParkingBrake`")
        }
        
        XCTAssertEqual(capability.status?.value, AAActiveState.active)
    }


    // MARK: Getters
    
    func testGetParkingBrakeState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x58, 0x00]
        
        XCTAssertEqual(bytes, AAParkingBrake.getParkingBrakeState())
    }
    
    func testGetParkingBrakeStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x58, 0x02]
        
        XCTAssertEqual(bytes, AAParkingBrake.getParkingBrakeStateAvailability())
    }


    // MARK: Setters
    
    func testSetParkingBrake() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x58, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAParkingBrake.setParkingBrake(status: AAActiveState.active)
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAParkingBrake.identifier, 0x0058)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAParkingBrake.PropertyIdentifier.status.rawValue, 0x01)
    }
}

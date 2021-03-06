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
//  AATrunkTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AATrunkTests: XCTestCase {

    // MARK: State Properties
    
    func testLock() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x21, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATrunk else {
            return XCTFail("Could not parse bytes as `AATrunk`")
        }
        
        XCTAssertEqual(capability.lock?.value, AALockState.unlocked)
    }
    
    func testPosition() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x21, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATrunk else {
            return XCTFail("Could not parse bytes as `AATrunk`")
        }
        
        XCTAssertEqual(capability.position?.value, AAPosition.open)
    }
    
    func testLockSafety() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x21, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATrunk else {
            return XCTFail("Could not parse bytes as `AATrunk`")
        }
        
        XCTAssertEqual(capability.lockSafety?.value, AALockSafety.safe)
    }


    // MARK: Getters
    
    func testGetTrunkState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x21, 0x00]
        
        XCTAssertEqual(bytes, AATrunk.getTrunkState())
    }
    
    func testGetTrunkStateAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x21, 0x02]
        
        XCTAssertEqual(bytes, AATrunk.getTrunkStateAvailability())
    }
    
    func testGetTrunkStateProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x21, 0x00, 0x01]
        let getterBytes = AATrunk.getTrunkStateProperties(ids: .lock)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetTrunkStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x21, 0x02, 0x01]
        let getterBytes = AATrunk.getTrunkStatePropertiesAvailability(ids: .lock)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testControlTrunk() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x21, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AATrunk.controlTrunk(lock: AALockState.unlocked, position: AAPosition.open)
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AATrunk.identifier, 0x0021)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AATrunk.PropertyIdentifier.lock.rawValue, 0x01)
        XCTAssertEqual(AATrunk.PropertyIdentifier.position.rawValue, 0x02)
        XCTAssertEqual(AATrunk.PropertyIdentifier.lockSafety.rawValue, 0x03)
    }
}

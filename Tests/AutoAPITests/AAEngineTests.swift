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
//  AAEngineTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAEngineTests: XCTestCase {

    // MARK: State Properties
    
    func testStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x69, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAEngine else {
            return XCTFail("Could not parse bytes as `AAEngine`")
        }
        
        XCTAssertEqual(capability.status?.value, AAOnOffState.off)
    }
    
    func testStartStopState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x69, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAEngine else {
            return XCTFail("Could not parse bytes as `AAEngine`")
        }
        
        XCTAssertEqual(capability.startStopState?.value, AAActiveState.active)
    }


    // MARK: Getters
    
    func testGetEngineState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x69, 0x00]
        
        XCTAssertEqual(bytes, AAEngine.getEngineState())
    }
    
    func testGetEngineStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x69, 0x02]
        
        XCTAssertEqual(bytes, AAEngine.getEngineStateAvailability())
    }
    
    func testGetEngineStateProperties() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x69, 0x00, 0x01]
        let getterBytes = AAEngine.getEngineStateProperties(ids: .status)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetEngineStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x69, 0x02, 0x01]
        let getterBytes = AAEngine.getEngineStatePropertiesAvailability(ids: .status)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testTurnEngineOnOff() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x69, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        let setterBytes = AAEngine.turnEngineOnOff(status: AAOnOffState.off)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testActivateDeactivateStartStop() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x69, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAEngine.activateDeactivateStartStop(startStopState: AAActiveState.active)
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAEngine.identifier, 0x0069)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAEngine.PropertyIdentifier.status.rawValue, 0x01)
        XCTAssertEqual(AAEngine.PropertyIdentifier.startStopState.rawValue, 0x02)
    }
}
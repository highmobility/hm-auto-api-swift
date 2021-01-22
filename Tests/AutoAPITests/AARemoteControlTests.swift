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
//  AARemoteControlTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AARemoteControlTests: XCTestCase {

    // MARK: State Properties
    
    func testControlMode() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x27, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARemoteControl else {
            return XCTFail("Could not parse bytes as `AARemoteControl`")
        }
        
        XCTAssertEqual(capability.controlMode?.value, ControlMode.started)
    }
    
    func testAngle() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x27, 0x01, 0x02, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x02, 0x00, 0x40, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AARemoteControl else {
            return XCTFail("Could not parse bytes as `AARemoteControl`")
        }
        
        XCTAssertEqual(capability.angle?.value, Measurement<UnitAngle>(value: 50.0, unit: .degrees))
    }


    // MARK: Non-state or Deprecated Properties
    
    func testSpeed() {
        let bytes: [UInt8] = [0x03, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x16, 0x01, 0x40, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitSpeed>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.speed`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitSpeed>(value: 5.0, unit: .kilometersPerHour))
    }


    // MARK: Getters
    
    func testGetControlState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x27, 0x00]
        
        XCTAssertEqual(bytes, AARemoteControl.getControlState())
    }
    
    func testGetControlStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x27, 0x02]
        
        XCTAssertEqual(bytes, AARemoteControl.getControlStateAvailability())
    }


    // MARK: Setters
    
    func testControlCommand() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x27, 0x01, 0x02, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x02, 0x00, 0x40, 0x49, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x16, 0x01, 0x40, 0x14, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        let setterBytes = AARemoteControl.controlCommand(angle: Measurement<UnitAngle>(value: 50.0, unit: .degrees), speed: Measurement<UnitSpeed>(value: 5.0, unit: .kilometersPerHour))
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testStartControl() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x27, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        let setterBytes = AARemoteControl.startControl()
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testStopControl() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x27, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x05]
        let setterBytes = AARemoteControl.stopControl()
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AARemoteControl.identifier, 0x0027)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AARemoteControl.PropertyIdentifier.controlMode.rawValue, 0x01)
        XCTAssertEqual(AARemoteControl.PropertyIdentifier.angle.rawValue, 0x02)
        XCTAssertEqual(AARemoteControl.PropertyIdentifier.speed.rawValue, 0x03)
    }
}

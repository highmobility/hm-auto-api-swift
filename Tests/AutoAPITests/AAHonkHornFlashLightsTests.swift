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
//  AAHonkHornFlashLightsTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAHonkHornFlashLightsTests: XCTestCase {

    // MARK: State Properties
    
    func testFlashers() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x26, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHonkHornFlashLights else {
            return XCTFail("Could not parse bytes as `AAHonkHornFlashLights`")
        }
        
        XCTAssertEqual(capability.flashers?.value, AAHonkHornFlashLightsFlashers.leftFlasherActive)
    }


    // MARK: Non-state or Deprecated Properties
    
    func testHonkSeconds() {
        let bytes: [UInt8] = [0x02, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x07, 0x00, 0x40, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitDuration>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.honkSeconds`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitDuration>(value: 3.0, unit: .seconds))
    }
    
    func testFlashTimes() {
        let bytes: [UInt8] = [0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x05]
        
        guard let property: AAProperty<UInt8> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.flashTimes`")
        }
        
        XCTAssertEqual(property.value, 5)
    }
    
    func testEmergencyFlashersState() {
        let bytes: [UInt8] = [0x04, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let property: AAProperty<AAActiveState> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.emergencyFlashersState`")
        }
        
        XCTAssertEqual(property.value, AAActiveState.active)
    }
    
    func testHonkTime() {
        let bytes: [UInt8] = [0x05, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x07, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitDuration>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.honkTime`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitDuration>(value: 2.0, unit: .seconds))
    }


    // MARK: Getters
    
    func testGetFlashersState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x26, 0x00]
        
        XCTAssertEqual(bytes, AAHonkHornFlashLights.getFlashersState())
    }
    
    func testGetFlashersStateAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x26, 0x02]
        
        XCTAssertEqual(bytes, AAHonkHornFlashLights.getFlashersStateAvailability())
    }


    // MARK: Setters
    
    func testHonkFlash() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x26, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x05, 0x05, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x07, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        let setterBytes = AAHonkHornFlashLights.honkFlash(flashTimes: 5, honkTime: Measurement<UnitDuration>(value: 2.0, unit: .seconds))
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testActivateDeactivateEmergencyFlasher() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x26, 0x01, 0x04, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAHonkHornFlashLights.activateDeactivateEmergencyFlasher(emergencyFlashersState: AAActiveState.active)
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAHonkHornFlashLights.identifier, 0x0026)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAHonkHornFlashLights.PropertyIdentifier.flashers.rawValue, 0x01)
        XCTAssertEqual(AAHonkHornFlashLights.PropertyIdentifier.flashTimes.rawValue, 0x03)
        XCTAssertEqual(AAHonkHornFlashLights.PropertyIdentifier.emergencyFlashersState.rawValue, 0x04)
        XCTAssertEqual(AAHonkHornFlashLights.PropertyIdentifier.honkTime.rawValue, 0x05)
    }
}

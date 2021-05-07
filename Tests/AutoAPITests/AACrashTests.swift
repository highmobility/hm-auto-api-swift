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
//  AACrashTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AACrashTests: XCTestCase {

    // MARK: State Properties
    
    func testIncidents() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x01, 0x01, 0x00, 0x06, 0x01, 0x00, 0x03, 0x00, 0x01, 0x01, 0x01, 0x00, 0x06, 0x01, 0x00, 0x03, 0x01, 0x02, 0x01, 0x01, 0x00, 0x06, 0x01, 0x00, 0x03, 0x02, 0x03, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACrash else {
            return XCTFail("Could not parse bytes as `AACrash`")
        }
        
        guard let incidents = capability.incidents?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.incidents` values from `AACrash` capability")
        }
        
        XCTAssertTrue(incidents.contains { $0.bytes == AACrashIncident(location: .front, severity: .high, repairs: .needed).bytes })
        XCTAssertTrue(incidents.contains { $0.bytes == AACrashIncident(location: .lateral, severity: .medium, repairs: .needed).bytes })
        XCTAssertTrue(incidents.contains { $0.bytes == AACrashIncident(location: .rear, severity: .low, repairs: .notNeeded).bytes })
    }
    
    func testType() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACrash else {
            return XCTFail("Could not parse bytes as `AACrash`")
        }
        
        XCTAssertEqual(capability.type?.value, AACrashType.nonPedestrian)
    }
    
    func testTippedState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACrash else {
            return XCTFail("Could not parse bytes as `AACrash`")
        }
        
        XCTAssertEqual(capability.tippedState?.value, AACrashTippedState.notTipped)
    }
    
    func testAutomaticECall() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x01, 0x04, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACrash else {
            return XCTFail("Could not parse bytes as `AACrash`")
        }
        
        XCTAssertEqual(capability.automaticECall?.value, AAEnabledState.enabled)
    }
    
    func testSeverity() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x01, 0x05, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACrash else {
            return XCTFail("Could not parse bytes as `AACrash`")
        }
        
        XCTAssertEqual(capability.severity?.value, 2)
    }
    
    func testImpactZone() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x01, 0x06, 0x00, 0x04, 0x01, 0x00, 0x01, 0x07]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACrash else {
            return XCTFail("Could not parse bytes as `AACrash`")
        }
        
        XCTAssertEqual(capability.impactZone?.value, AACrashImpactZone.frontDriverSide)
    }


    // MARK: Getters
    
    func testGetCrashState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x00]
        
        XCTAssertEqual(bytes, AACrash.getCrashState())
    }
    
    func testGetCrashStateAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x02]
        
        XCTAssertEqual(bytes, AACrash.getCrashStateAvailability())
    }
    
    func testGetCrashStateProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x00, 0x01]
        let getterBytes = AACrash.getCrashStateProperties(ids: .incidents)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetCrashStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x6b, 0x02, 0x01]
        let getterBytes = AACrash.getCrashStatePropertiesAvailability(ids: .incidents)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AACrash.identifier, 0x006B)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AACrash.PropertyIdentifier.incidents.rawValue, 0x01)
        XCTAssertEqual(AACrash.PropertyIdentifier.type.rawValue, 0x02)
        XCTAssertEqual(AACrash.PropertyIdentifier.tippedState.rawValue, 0x03)
        XCTAssertEqual(AACrash.PropertyIdentifier.automaticECall.rawValue, 0x04)
        XCTAssertEqual(AACrash.PropertyIdentifier.severity.rawValue, 0x05)
        XCTAssertEqual(AACrash.PropertyIdentifier.impactZone.rawValue, 0x06)
    }
}
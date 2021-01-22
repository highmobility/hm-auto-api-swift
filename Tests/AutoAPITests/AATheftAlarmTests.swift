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
//  AATheftAlarmTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AATheftAlarmTests: XCTestCase {

    // MARK: State Properties
    
    func testStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATheftAlarm else {
            return XCTFail("Could not parse bytes as `AATheftAlarm`")
        }
        
        XCTAssertEqual(capability.status?.value, Status.armed)
    }
    
    func testInteriorProtectionStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATheftAlarm else {
            return XCTFail("Could not parse bytes as `AATheftAlarm`")
        }
        
        XCTAssertEqual(capability.interiorProtectionStatus?.value, AAActiveSelectedState.active)
    }
    
    func testTowProtectionStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATheftAlarm else {
            return XCTFail("Could not parse bytes as `AATheftAlarm`")
        }
        
        XCTAssertEqual(capability.towProtectionStatus?.value, AAActiveSelectedState.active)
    }
    
    func testLastWarningReason() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x01, 0x04, 0x00, 0x04, 0x01, 0x00, 0x01, 0x06]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATheftAlarm else {
            return XCTFail("Could not parse bytes as `AATheftAlarm`")
        }
        
        XCTAssertEqual(capability.lastWarningReason?.value, LastWarningReason.hood)
    }
    
    func testLastEvent() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x01, 0x05, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x00, 0x00, 0x01, 0x72, 0xbc, 0xd2, 0x5b, 0x10]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATheftAlarm else {
            return XCTFail("Could not parse bytes as `AATheftAlarm`")
        }
        
        XCTAssertNotNil(DateFormatter.hmFormatter.date(from: "2020-06-16T11:10:02.000Z"))
        XCTAssertEqual(capability.lastEvent?.value, DateFormatter.hmFormatter.date(from: "2020-06-16T11:10:02.000Z"))
    }
    
    func testLastEventLevel() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x01, 0x06, 0x00, 0x04, 0x01, 0x00, 0x01, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATheftAlarm else {
            return XCTFail("Could not parse bytes as `AATheftAlarm`")
        }
        
        XCTAssertEqual(capability.lastEventLevel?.value, LastEventLevel.low)
    }
    
    func testEventType() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x01, 0x07, 0x00, 0x04, 0x01, 0x00, 0x01, 0x05]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AATheftAlarm else {
            return XCTFail("Could not parse bytes as `AATheftAlarm`")
        }
        
        XCTAssertEqual(capability.eventType?.value, EventType.rearRight)
    }


    // MARK: Getters
    
    func testGetTheftAlarmState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x00]
        
        XCTAssertEqual(bytes, AATheftAlarm.getTheftAlarmState())
    }
    
    func testGetTheftAlarmStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x02]
        
        XCTAssertEqual(bytes, AATheftAlarm.getTheftAlarmStateAvailability())
    }
    
    func testGetTheftAlarmStateProperties() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x00, 0x01]
        let getterBytes = AATheftAlarm.getTheftAlarmStateProperties(ids: .status)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetTheftAlarmStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x02, 0x01]
        let getterBytes = AATheftAlarm.getTheftAlarmStatePropertiesAvailability(ids: .status)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testSetTheftAlarm() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x46, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AATheftAlarm.setTheftAlarm(status: Status.armed)
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AATheftAlarm.identifier, 0x0046)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AATheftAlarm.PropertyIdentifier.status.rawValue, 0x01)
        XCTAssertEqual(AATheftAlarm.PropertyIdentifier.interiorProtectionStatus.rawValue, 0x02)
        XCTAssertEqual(AATheftAlarm.PropertyIdentifier.towProtectionStatus.rawValue, 0x03)
        XCTAssertEqual(AATheftAlarm.PropertyIdentifier.lastWarningReason.rawValue, 0x04)
        XCTAssertEqual(AATheftAlarm.PropertyIdentifier.lastEvent.rawValue, 0x05)
        XCTAssertEqual(AATheftAlarm.PropertyIdentifier.lastEventLevel.rawValue, 0x06)
        XCTAssertEqual(AATheftAlarm.PropertyIdentifier.eventType.rawValue, 0x07)
    }
}

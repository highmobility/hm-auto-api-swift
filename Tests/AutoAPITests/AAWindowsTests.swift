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
//  AAWindowsTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAWindowsTests: XCTestCase {

    // MARK: State Properties
    
    func testOpenPercentages() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x45, 0x01, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x00, 0x3f, 0xc9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x01, 0x3f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x02, 0x3f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x03, 0x3f, 0xb9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x04, 0x3f, 0xc7, 0x0a, 0x3d, 0x70, 0xa3, 0xd7, 0x0a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindows else {
            return XCTFail("Could not parse bytes as `AAWindows`")
        }
        
        guard let openPercentages = capability.openPercentages?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.openPercentages` values from `AAWindows` capability")
        }
        
        XCTAssertTrue(openPercentages.contains { $0.bytes == AAWindowOpenPercentage(location: .frontLeft, openPercentage: 0.2).bytes })
        XCTAssertTrue(openPercentages.contains { $0.bytes == AAWindowOpenPercentage(location: .frontRight, openPercentage: 0.5).bytes })
        XCTAssertTrue(openPercentages.contains { $0.bytes == AAWindowOpenPercentage(location: .rearRight, openPercentage: 0.5).bytes })
        XCTAssertTrue(openPercentages.contains { $0.bytes == AAWindowOpenPercentage(location: .rearLeft, openPercentage: 0.1).bytes })
        XCTAssertTrue(openPercentages.contains { $0.bytes == AAWindowOpenPercentage(location: .hatch, openPercentage: 0.18).bytes })
    }
    
    func testPositions() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x45, 0x01, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x00, 0x01, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x01, 0x01, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x02, 0x00, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x03, 0x01, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x04, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAWindows else {
            return XCTFail("Could not parse bytes as `AAWindows`")
        }
        
        guard let positions = capability.positions?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.positions` values from `AAWindows` capability")
        }
        
        XCTAssertTrue(positions.contains { $0.bytes == AAWindowPosition(location: .frontLeft, position: .open).bytes })
        XCTAssertTrue(positions.contains { $0.bytes == AAWindowPosition(location: .frontRight, position: .open).bytes })
        XCTAssertTrue(positions.contains { $0.bytes == AAWindowPosition(location: .rearRight, position: .closed).bytes })
        XCTAssertTrue(positions.contains { $0.bytes == AAWindowPosition(location: .rearLeft, position: .open).bytes })
        XCTAssertTrue(positions.contains { $0.bytes == AAWindowPosition(location: .hatch, position: .open).bytes })
    }


    // MARK: Getters
    
    func testGetWindows() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x45, 0x00]
        
        XCTAssertEqual(bytes, AAWindows.getWindows())
    }
    
    func testGetWindowsAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x45, 0x02]
        
        XCTAssertEqual(bytes, AAWindows.getWindowsAvailability())
    }
    
    func testGetWindowsProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x45, 0x00, 0x02]
        let getterBytes = AAWindows.getWindowsProperties(ids: .openPercentages)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetWindowsPropertiesAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x45, 0x02, 0x02]
        let getterBytes = AAWindows.getWindowsPropertiesAvailability(ids: .openPercentages)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testControlWindows() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x45, 0x01, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x00, 0x3f, 0xc9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x01, 0x3f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x02, 0x3f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x03, 0x3f, 0xb9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a, 0x02, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x04, 0x3f, 0xc7, 0x0a, 0x3d, 0x70, 0xa3, 0xd7, 0x0a, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x00, 0x01, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x01, 0x01, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x02, 0x00, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x03, 0x01, 0x03, 0x00, 0x05, 0x01, 0x00, 0x02, 0x04, 0x01]
        let setterBytes = AAWindows.controlWindows(openPercentages: [AAWindowOpenPercentage(location: .frontLeft, openPercentage: 0.2), AAWindowOpenPercentage(location: .frontRight, openPercentage: 0.5), AAWindowOpenPercentage(location: .rearRight, openPercentage: 0.5), AAWindowOpenPercentage(location: .rearLeft, openPercentage: 0.1), AAWindowOpenPercentage(location: .hatch, openPercentage: 0.18)], positions: [AAWindowPosition(location: .frontLeft, position: .open), AAWindowPosition(location: .frontRight, position: .open), AAWindowPosition(location: .rearRight, position: .closed), AAWindowPosition(location: .rearLeft, position: .open), AAWindowPosition(location: .hatch, position: .open)])
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAWindows.identifier, 0x0045)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAWindows.PropertyIdentifier.openPercentages.rawValue, 0x02)
        XCTAssertEqual(AAWindows.PropertyIdentifier.positions.rawValue, 0x03)
    }
}

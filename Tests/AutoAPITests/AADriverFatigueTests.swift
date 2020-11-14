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
//  AADriverFatigueTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AADriverFatigueTests: XCTestCase {

    // MARK: State Properties
    
    func testDetectedFatigueLevel() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x41, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AADriverFatigue else {
            return XCTFail("Could not parse bytes as `AADriverFatigue`")
        }
        
        XCTAssertEqual(capability.detectedFatigueLevel?.value, AADriverFatigue.DetectedFatigueLevel.pauseRecommended)
    }


    // MARK: Getters
    
    func testGetDriverFatigueState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x41, 0x00]
        
        XCTAssertEqual(bytes, AADriverFatigue.getDriverFatigueState())
    }
    
    func testGetDriverFatigueStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x41, 0x02]
        
        XCTAssertEqual(bytes, AADriverFatigue.getDriverFatigueStateAvailability())
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AADriverFatigue.identifier, 0x0041)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AADriverFatigue.PropertyIdentifier.detectedFatigueLevel.rawValue, 0x01)
    }
}
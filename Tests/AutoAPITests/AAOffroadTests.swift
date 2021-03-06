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
//  AAOffroadTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAOffroadTests: XCTestCase {

    // MARK: State Properties
    
    func testRouteIncline() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x52, 0x01, 0x01, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x02, 0x00, 0x40, 0x24, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAOffroad else {
            return XCTFail("Could not parse bytes as `AAOffroad`")
        }
        
        XCTAssertEqual(capability.routeIncline?.value, Measurement<UnitAngle>(value: 10.1, unit: .degrees))
    }
    
    func testWheelSuspension() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x52, 0x01, 0x02, 0x00, 0x0b, 0x01, 0x00, 0x08, 0x3f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAOffroad else {
            return XCTFail("Could not parse bytes as `AAOffroad`")
        }
        
        XCTAssertEqual(capability.wheelSuspension?.value, 0.5)
    }


    // MARK: Getters
    
    func testGetOffroadState() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x52, 0x00]
        
        XCTAssertEqual(bytes, AAOffroad.getOffroadState())
    }
    
    func testGetOffroadStateAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x52, 0x02]
        
        XCTAssertEqual(bytes, AAOffroad.getOffroadStateAvailability())
    }
    
    func testGetOffroadStateProperties() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x52, 0x00, 0x01]
        let getterBytes = AAOffroad.getOffroadStateProperties(ids: .routeIncline)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetOffroadStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0d, 0x00, 0x52, 0x02, 0x01]
        let getterBytes = AAOffroad.getOffroadStatePropertiesAvailability(ids: .routeIncline)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAOffroad.identifier, 0x0052)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAOffroad.PropertyIdentifier.routeIncline.rawValue, 0x01)
        XCTAssertEqual(AAOffroad.PropertyIdentifier.wheelSuspension.rawValue, 0x02)
    }
}

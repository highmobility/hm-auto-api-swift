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
//  AACapabilitiesTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AACapabilitiesTests: XCTestCase {

    // MARK: State Properties
    
    func testCapabilities() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x10, 0x01, 0x01, 0x00, 0x0c, 0x01, 0x00, 0x09, 0x00, 0x20, 0x00, 0x05, 0x02, 0x03, 0x04, 0x05, 0x06, 0x01, 0x00, 0x0a, 0x01, 0x00, 0x07, 0x00, 0x23, 0x00, 0x03, 0x02, 0x08, 0x11]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACapabilities else {
            return XCTFail("Could not parse bytes as `AACapabilities`")
        }
        
        guard let capabilities = capability.capabilities?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.capabilities` values from `AACapabilities` capability")
        }
        
        XCTAssertTrue(capabilities.contains { $0.bytes == AASupportedCapability(capabilityID: 0x0020, supportedPropertyIDs: [2, 3, 4, 5, 6]).bytes })
        XCTAssertTrue(capabilities.contains { $0.bytes == AASupportedCapability(capabilityID: 0x0023, supportedPropertyIDs: [2, 8, 17]).bytes })
    }
    
    func testWebhooks() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x10, 0x01, 0x02, 0x00, 0x05, 0x01, 0x00, 0x02, 0x01, 0x01, 0x02, 0x00, 0x05, 0x01, 0x00, 0x02, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AACapabilities else {
            return XCTFail("Could not parse bytes as `AACapabilities`")
        }
        
        guard let webhooks = capability.webhooks?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.webhooks` values from `AACapabilities` capability")
        }
        
        XCTAssertTrue(webhooks.contains { $0.bytes == AAWebhook(available: .available, event: .tripStarted).bytes })
        XCTAssertTrue(webhooks.contains { $0.bytes == AAWebhook(available: .available, event: .tripEnded).bytes })
    }


    // MARK: Getters
    
    func testGetCapabilities() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x10, 0x00]
        
        XCTAssertEqual(bytes, AACapabilities.getCapabilities())
    }
    
    func testGetCapabilitiesProperties() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x10, 0x00, 0x01]
        let getterBytes = AACapabilities.getCapabilitiesProperties(ids: .capabilities)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AACapabilities.identifier, 0x0010)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AACapabilities.PropertyIdentifier.capabilities.rawValue, 0x01)
        XCTAssertEqual(AACapabilities.PropertyIdentifier.webhooks.rawValue, 0x02)
    }
}
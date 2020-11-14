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
//  AACapabilities.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AACapabilities: AACapability, AAPropertyIdentifying {

    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AACapabilities` was introduced to the spec.
        public static let intro: UInt8 = 2
    
        /// Level (version) of *AutoAPI* when `AACapabilities` was last updated.
        public static let updated: UInt8 = 12
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x0010 }


    /// Property identifiers for `AACapabilities`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case capabilities = 0x01
        case webhooks = 0x02
    }


    // MARK: Properties
    
    /// Capabilities value.
    public var capabilities: [AAProperty<AASupportedCapability>]?
    
    /// Webhooks value.
    public var webhooks: [AAProperty<AAWebhook>]?


    // MARK: Getters
    
    /// Get `AACapabilities` state (all properties).
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getCapabilities() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.get.rawValue.bytes
    }
    
    /// Get `AACapabilities` state's specific properties.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getCapabilitiesProperties(ids: PropertyIdentifier...) -> [UInt8] {
        getCapabilities() + ids.map { $0.rawValue }
    }


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        capabilities = extract(properties: .capabilities)
        webhooks = extract(properties: .webhooks)
    }
}
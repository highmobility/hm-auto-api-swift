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
//  AAPowerTakeoff.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAPowerTakeoff: AACapability, AAPropertyIdentifying {

    public typealias Engaged = AAPowerTakeoffEngaged


    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AAPowerTakeoff` was introduced to the spec.
        public static let intro: UInt8 = 7
    
        /// Level (version) of *AutoAPI* when `AAPowerTakeoff` was last updated.
        public static let updated: UInt8 = 11
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x0065 }


    /// Property identifiers for `AAPowerTakeoff`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case status = 0x01
        case engaged = 0x02
    }


    // MARK: Properties
    
    /// Engaged value.
    public var engaged: AAProperty<Engaged>?
    
    /// Status value.
    public var status: AAProperty<AAActiveState>?


    // MARK: Getters
    
    /// Get `AAPowerTakeoff` state (all properties).
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getPowerTakeoffState() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.get.rawValue.bytes
    }
    
    /// Get `AAPowerTakeoff` state's specific properties.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getPowerTakeoffStateProperties(ids: PropertyIdentifier...) -> [UInt8] {
        getPowerTakeoffState() + ids.map { $0.rawValue }
    }
    
    /// Get `AAPowerTakeoff` state properties availability.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getPowerTakeoffStateAvailability() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.availability.rawValue.bytes
    }
    
    /// Get `AAPowerTakeoff` state's specific properties' availability.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request availability for.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getPowerTakeoffStatePropertiesAvailability(ids: PropertyIdentifier...) -> [UInt8] {
        getPowerTakeoffStateAvailability() + ids.map { $0.rawValue }
    }


    // MARK: Setters
    
    /// Activate or deactivate power take-off.
    /// 
    /// - parameters:
    ///     - status: Status value.
    ///
    /// - returns: Command as `[UInt8]` to send to the vehicle.
    public static func activateDeactivatePowerTakeoff(status: AAActiveState) -> [UInt8] {
        var properties: [AAOpaqueProperty?] = []
    
        properties.append(AAProperty(id: PropertyIdentifier.status, value: status))
    
        let propertiesBytes = properties.compactMap { $0 }.sorted { $0.id < $1.id }.flatMap { $0.bytes }
    
        return setterHeader + propertiesBytes
    }


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        engaged = extract(property: .engaged)
        status = extract(property: .status)
    }
}

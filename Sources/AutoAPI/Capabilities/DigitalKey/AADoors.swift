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
//  AADoors.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AADoors: AACapability, AAPropertyIdentifying {

    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AADoors` was introduced to the spec.
        public static let intro: UInt8 = 1
    
        /// Level (version) of *AutoAPI* when `AADoors` was last updated.
        public static let updated: UInt8 = 11
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x0020 }


    /// Property identifiers for `AADoors`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case insideLocks = 0x02
        case locks = 0x03
        case positions = 0x04
        case insideLocksState = 0x05
        case locksState = 0x06
    }


    // MARK: Properties
    
    /// Inside lock states for the given doors.
    public var insideLocks: [AAProperty<AALock>]?
    
    /// Inside locks state for the whole vehicle (combines all specific lock states if available).
    public var insideLocksState: AAProperty<AALockState>?
    
    /// Lock states for the given doors.
    public var locks: [AAProperty<AALock>]?
    
    /// Locks state for the whole vehicle (combines all specific lock states if available).
    public var locksState: AAProperty<AALockState>?
    
    /// Door positions for the given doors.
    public var positions: [AAProperty<AADoorPosition>]?


    // MARK: Getters
    
    /// Get `AADoors` state (all properties).
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getDoorsState() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.get.rawValue.bytes
    }
    
    /// Get `AADoors` state's specific properties.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getDoorsStateProperties(ids: PropertyIdentifier...) -> [UInt8] {
        getDoorsState() + ids.map { $0.rawValue }
    }
    
    /// Get `AADoors` state properties availability.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getDoorsStateAvailability() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.availability.rawValue.bytes
    }
    
    /// Get `AADoors` state's specific properties' availability.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request availability for.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getDoorsStatePropertiesAvailability(ids: PropertyIdentifier...) -> [UInt8] {
        getDoorsStateAvailability() + ids.map { $0.rawValue }
    }


    // MARK: Setters
    
    /// Attempt to lock or unlock all doors of the vehicle.
    /// 
    /// - parameters:
    ///     - locksState: Locks state for the whole vehicle (combines all specific lock states if available).
    ///
    /// - returns: Command as `[UInt8]` to send to the vehicle.
    public static func lockUnlockDoors(locksState: AALockState) -> [UInt8] {
        var properties: [AAOpaqueProperty?] = []
    
        properties.append(AAProperty(id: PropertyIdentifier.locksState, value: locksState))
    
        let propertiesBytes = properties.compactMap { $0 }.sorted { $0.id < $1.id }.flatMap { $0.bytes }
    
        return setterHeader + propertiesBytes
    }


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        insideLocks = extract(properties: .insideLocks)
        insideLocksState = extract(property: .insideLocksState)
        locks = extract(properties: .locks)
        locksState = extract(property: .locksState)
        positions = extract(properties: .positions)
    }
}
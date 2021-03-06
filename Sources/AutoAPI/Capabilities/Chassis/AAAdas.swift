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
//  AAAdas.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAAdas: AACapability, AAPropertyIdentifying {

    public typealias BlindSpotWarningSystemCoverage = AAAdasBlindSpotWarningSystemCoverage


    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AAAdas` was introduced to the spec.
        public static let intro: UInt8 = 13
    
        /// Level (version) of *AutoAPI* when `AAAdas` was last updated.
        public static let updated: UInt8 = 13
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x006C }


    /// Property identifiers for `AAAdas`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case status = 0x01
        case alertnessSystemStatus = 0x02
        case forwardCollisionWarningSystem = 0x03
        case blindSpotWarningState = 0x04
        case blindSpotWarningSystemCoverage = 0x05
        case rearCrossWarningSystem = 0x06
        case automatedParkingBrake = 0x07
        case laneKeepAssistSystem = 0x08
        case laneKeepAssistsStates = 0x09
        case parkAssists = 0x0a
        case blindSpotWarningSystem = 0x0b
    }


    // MARK: Properties
    
    /// Indicates if the driver alertness warning is active or inactive..
    public var alertnessSystemStatus: AAProperty<AAActiveState>?
    
    /// Automatic brake state.
    public var automatedParkingBrake: AAProperty<AAActiveState>?
    
    /// Indicates whether the blind spot warning system is active or not..
    public var blindSpotWarningState: AAProperty<AAActiveState>?
    
    /// Indicates whether the blind spot warning system is turned on or not..
    public var blindSpotWarningSystem: AAProperty<AAOnOffState>?
    
    /// Blind spot warning system coverage..
    public var blindSpotWarningSystemCoverage: AAProperty<BlindSpotWarningSystemCoverage>?
    
    /// Indicates whether the forward collision warning system is active or inactive..
    public var forwardCollisionWarningSystem: AAProperty<AAActiveState>?
    
    /// Indicates if the lane keep assist system is turned on or not..
    public var laneKeepAssistSystem: AAProperty<AAOnOffState>?
    
    /// Lane keeping assist state indicating the vehicle is actively controlling the wheels..
    public var laneKeepAssistsStates: [AAProperty<AALaneKeepAssistState>]?
    
    /// If the alarm is active and the driver has muted or not park assists..
    public var parkAssists: [AAProperty<AAParkAssist>]?
    
    /// Indicates whether the rear cross warning system is active or not..
    public var rearCrossWarningSystem: AAProperty<AAActiveState>?
    
    /// Indicates whether the driver assistance system is active or not..
    public var status: AAProperty<AAOnOffState>?


    // MARK: Getters
    
    /// Get `AAAdas` state (all properties).
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getAdasState() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.get.rawValue.bytes
    }
    
    /// Get `AAAdas` state's specific properties.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getAdasStateProperties(ids: PropertyIdentifier...) -> [UInt8] {
        getAdasState() + ids.map { $0.rawValue }
    }
    
    /// Get `AAAdas` state properties availability.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getAdasStateAvailability() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.availability.rawValue.bytes
    }
    
    /// Get `AAAdas` state's specific properties' availability.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request availability for.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getAdasStatePropertiesAvailability(ids: PropertyIdentifier...) -> [UInt8] {
        getAdasStateAvailability() + ids.map { $0.rawValue }
    }


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        alertnessSystemStatus = extract(property: .alertnessSystemStatus)
        automatedParkingBrake = extract(property: .automatedParkingBrake)
        blindSpotWarningState = extract(property: .blindSpotWarningState)
        blindSpotWarningSystem = extract(property: .blindSpotWarningSystem)
        blindSpotWarningSystemCoverage = extract(property: .blindSpotWarningSystemCoverage)
        forwardCollisionWarningSystem = extract(property: .forwardCollisionWarningSystem)
        laneKeepAssistSystem = extract(property: .laneKeepAssistSystem)
        laneKeepAssistsStates = extract(properties: .laneKeepAssistsStates)
        parkAssists = extract(properties: .parkAssists)
        rearCrossWarningSystem = extract(property: .rearCrossWarningSystem)
        status = extract(property: .status)
    }
}

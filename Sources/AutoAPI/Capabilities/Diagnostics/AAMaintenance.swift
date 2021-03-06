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
//  AAMaintenance.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAMaintenance: AACapability, AAPropertyIdentifying {

    public typealias TeleserviceAvailability = AAMaintenanceTeleserviceAvailability


    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AAMaintenance` was introduced to the spec.
        public static let intro: UInt8 = 3
    
        /// Level (version) of *AutoAPI* when `AAMaintenance` was last updated.
        public static let updated: UInt8 = 13
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x0034 }


    /// Property identifiers for `AAMaintenance`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case cbsReportsCount = 0x03
        case teleserviceAvailability = 0x05
        case serviceDistanceThreshold = 0x06
        case serviceTimeThreshold = 0x07
        case automaticTeleserviceCallDate = 0x08
        case teleserviceBatteryCallDate = 0x09
        case nextInspectionDate = 0x0a
        case conditionBasedServices = 0x0b
        case brakeFluidChangeDate = 0x0c
        case timeToNextService = 0x0d
        case distanceToNextService = 0x0e
        case timeToExhaustInspection = 0x0f
        case lastECall = 0x10
        case distanceToNextOilService = 0x11
        case timeToNextOilService = 0x12
    }


    // MARK: Properties
    
    /// Automatic teleservice call date.
    public var automaticTeleserviceCallDate: AAProperty<Date>?
    
    /// Brake fluid change date.
    public var brakeFluidChangeDate: AAProperty<Date>?
    
    /// The number of CBS reports.
    public var cbsReportsCount: AAProperty<UInt8>?
    
    /// Condition based services value.
    public var conditionBasedServices: [AAProperty<AAConditionBasedService>]?
    
    /// Indicates the remaining distance until the next oil service; if this limit was exceeded, this value indicates the distance that has been driven since then..
    public var distanceToNextOilService: AAProperty<Measurement<UnitLength>>?
    
    /// The distance until next servicing of the vehicle.
    public var distanceToNextService: AAProperty<Measurement<UnitLength>>?
    
    /// Date-time of the last eCall.
    public var lastECall: AAProperty<Date>?
    
    /// Next inspection date.
    public var nextInspectionDate: AAProperty<Date>?
    
    /// Distance threshold for service.
    public var serviceDistanceThreshold: AAProperty<Measurement<UnitLength>>?
    
    /// Time threshold for service.
    public var serviceTimeThreshold: AAProperty<Measurement<UnitDuration>>?
    
    /// Teleservice availability value.
    public var teleserviceAvailability: AAProperty<TeleserviceAvailability>?
    
    /// Teleservice batter call date.
    public var teleserviceBatteryCallDate: AAProperty<Date>?
    
    /// Time until exhaust inspection.
    public var timeToExhaustInspection: AAProperty<Measurement<UnitDuration>>?
    
    /// Indicates the time remaining until the next oil service; if this limit was exceeded, this value indicates the time that has passed since then..
    public var timeToNextOilService: AAProperty<Measurement<UnitDuration>>?
    
    /// Time until next servicing of the vehicle.
    public var timeToNextService: AAProperty<Measurement<UnitDuration>>?
    
    // Deprecated
    
    /// Time until next servicing of the car.
    ///
    /// - warning: This property is deprecated in favour of *timeToNextService*.
    @available(*, deprecated, renamed: "timeToNextService", message: "removed the unit from the name")
    public var daysToNextService: AAProperty<Measurement<UnitDuration>>? {
        timeToNextService
    }
    
    /// The distance until next servicing of the vehicle.
    ///
    /// - warning: This property is deprecated in favour of *distanceToNextService*.
    @available(*, deprecated, renamed: "distanceToNextService", message: "removed the unit from the name")
    public var kilometersToNextService: AAProperty<Measurement<UnitLength>>? {
        distanceToNextService
    }
    
    /// Time until exhaust inspection.
    ///
    /// - warning: This property is deprecated in favour of *timeToExhaustInspection*.
    @available(*, deprecated, renamed: "timeToExhaustInspection", message: "removed the unit from the name")
    public var monthsToExhaustInspection: AAProperty<Measurement<UnitDuration>>? {
        timeToExhaustInspection
    }


    // MARK: Getters
    
    /// Get `AAMaintenance` state (all properties).
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getMaintenanceState() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.get.rawValue.bytes
    }
    
    /// Get `AAMaintenance` state's specific properties.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getMaintenanceStateProperties(ids: PropertyIdentifier...) -> [UInt8] {
        getMaintenanceState() + ids.map { $0.rawValue }
    }
    
    /// Get `AAMaintenance` state properties availability.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getMaintenanceStateAvailability() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.availability.rawValue.bytes
    }
    
    /// Get `AAMaintenance` state's specific properties' availability.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request availability for.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getMaintenanceStatePropertiesAvailability(ids: PropertyIdentifier...) -> [UInt8] {
        getMaintenanceStateAvailability() + ids.map { $0.rawValue }
    }


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        automaticTeleserviceCallDate = extract(property: .automaticTeleserviceCallDate)
        brakeFluidChangeDate = extract(property: .brakeFluidChangeDate)
        cbsReportsCount = extract(property: .cbsReportsCount)
        conditionBasedServices = extract(properties: .conditionBasedServices)
        distanceToNextOilService = extract(property: .distanceToNextOilService)
        distanceToNextService = extract(property: .distanceToNextService)
        lastECall = extract(property: .lastECall)
        nextInspectionDate = extract(property: .nextInspectionDate)
        serviceDistanceThreshold = extract(property: .serviceDistanceThreshold)
        serviceTimeThreshold = extract(property: .serviceTimeThreshold)
        teleserviceAvailability = extract(property: .teleserviceAvailability)
        teleserviceBatteryCallDate = extract(property: .teleserviceBatteryCallDate)
        timeToExhaustInspection = extract(property: .timeToExhaustInspection)
        timeToNextOilService = extract(property: .timeToNextOilService)
        timeToNextService = extract(property: .timeToNextService)
    }
}

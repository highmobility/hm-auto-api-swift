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
//  AATrips.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AATrips: AACapability, AAPropertyIdentifying {

    public typealias TypeOf = AATripsType


    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AATrips` was introduced to the spec.
        public static let intro: UInt8 = 12
    
        /// Level (version) of *AutoAPI* when `AATrips` was last updated.
        public static let updated: UInt8 = 12
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x006A }


    /// Property identifiers for `AATrips`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case type = 0x01
        case driverName = 0x02
        case description = 0x03
        case startTime = 0x04
        case endTime = 0x05
        case startAddress = 0x06
        case endAddress = 0x07
        case startCoordinates = 0x08
        case endCoordinates = 0x09
        case startOdometer = 0x0a
        case endOdometer = 0x0b
        case averageFuelConsumption = 0x0c
        case distance = 0x0d
        case startAddressComponents = 0x0e
        case endAddressComponents = 0x0f
    }


    // MARK: Properties
    
    /// Average fuel consumption during the trip.
    public var averageFuelConsumption: AAProperty<Measurement<UnitFuelEfficiency>>?
    
    /// Description of the trip.
    public var description: AAProperty<String>?
    
    /// Distance of the trip.
    public var distance: AAProperty<Measurement<UnitLength>>?
    
    /// Name of the driver of the trip.
    public var driverName: AAProperty<String>?
    
    /// End address of the trip.
    public var endAddress: AAProperty<String>?
    
    /// End address components.
    public var endAddressComponents: [AAProperty<AAAddressComponent>]?
    
    /// End coordinates of the trip.
    public var endCoordinates: AAProperty<AACoordinates>?
    
    /// Odometer reading at the end of the trip.
    public var endOdometer: AAProperty<Measurement<UnitLength>>?
    
    /// End time of the trip.
    public var endTime: AAProperty<Date>?
    
    /// Start address of the trip.
    public var startAddress: AAProperty<String>?
    
    /// Start address components.
    public var startAddressComponents: [AAProperty<AAAddressComponent>]?
    
    /// Start coordinates of the trip.
    public var startCoordinates: AAProperty<AACoordinates>?
    
    /// Odometer reading at the start of the trip.
    public var startOdometer: AAProperty<Measurement<UnitLength>>?
    
    /// Start time of the trip.
    public var startTime: AAProperty<Date>?
    
    /// Type of the trip.
    public var type: AAProperty<TypeOf>?


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        averageFuelConsumption = extract(property: .averageFuelConsumption)
        description = extract(property: .description)
        distance = extract(property: .distance)
        driverName = extract(property: .driverName)
        endAddress = extract(property: .endAddress)
        endAddressComponents = extract(properties: .endAddressComponents)
        endCoordinates = extract(property: .endCoordinates)
        endOdometer = extract(property: .endOdometer)
        endTime = extract(property: .endTime)
        startAddress = extract(property: .startAddress)
        startAddressComponents = extract(properties: .startAddressComponents)
        startCoordinates = extract(property: .startCoordinates)
        startOdometer = extract(property: .startOdometer)
        startTime = extract(property: .startTime)
        type = extract(property: .type)
    }
}

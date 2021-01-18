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
//  AAVehicleInformation.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAVehicleInformation: AACapability, AAPropertyIdentifying {

    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AAVehicleInformation` was introduced to the spec.
        public static let intro: UInt8 = 12
    
        /// Level (version) of *AutoAPI* when `AAVehicleInformation` was last updated.
        public static let updated: UInt8 = 12
    }


    /// Display unit enum.
    public enum DisplayUnit: UInt8, CaseIterable, Codable, HMBytesConvertable {
        case km = 0x00
        case miles = 0x01
    }

    /// Wheels driven by the engine.
    public enum Drive: UInt8, CaseIterable, Codable, HMBytesConvertable {
        case fwd = 0x00
        case rwd = 0x01
        case fourWd = 0x02
        case awd = 0x03
    }

    /// Driver seat location enum.
    public enum DriverSeatLocation: UInt8, CaseIterable, Codable, HMBytesConvertable {
        case left = 0x00
        case right = 0x01
        case center = 0x02
    }

    /// Gearbox enum.
    public enum Gearbox: UInt8, CaseIterable, Codable, HMBytesConvertable {
        case manual = 0x00
        case automatic = 0x01
        case semiAutomatic = 0x02
    }

    /// Powertrain enum.
    public enum Powertrain: UInt8, CaseIterable, Codable, HMBytesConvertable {
        case unknown = 0x00
        case allElectric = 0x01
        case combustionEngine = 0x02
        case phev = 0x03
        case hydrogen = 0x04
        case hydrogenHybrid = 0x05
    }

    /// The timeformat on headunit.
    public enum Timeformat: UInt8, CaseIterable, Codable, HMBytesConvertable {
        case twelveH = 0x00
        case twentyFourH = 0x01
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x0014 }


    /// Property identifiers for `AAVehicleInformation`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case powertrain = 0x02
        case modelName = 0x03
        case name = 0x04
        case licensePlate = 0x05
        case salesDesignation = 0x06
        case modelYear = 0x07
        case colourName = 0x08
        case numberOfDoors = 0x0a
        case numberOfSeats = 0x0b
        case engineVolume = 0x0c
        case engineMaxTorque = 0x0d
        case gearbox = 0x0e
        case displayUnit = 0x0f
        case driverSeatLocation = 0x10
        case equipments = 0x11
        case power = 0x13
        case language = 0x14
        case timeformat = 0x15
        case drive = 0x16
    }


    // MARK: Properties
    
    /// The colour name.
    public var colourName: AAProperty<String>?
    
    /// Display unit value.
    public var displayUnit: AAProperty<DisplayUnit>?
    
    /// Wheels driven by the engine.
    public var drive: AAProperty<Drive>?
    
    /// Driver seat location value.
    public var driverSeatLocation: AAProperty<DriverSeatLocation>?
    
    /// The maximum engine torque.
    public var engineMaxTorque: AAProperty<Measurement<UnitTorque>>?
    
    /// The engine volume displacement.
    public var engineVolume: AAProperty<Measurement<UnitVolume>>?
    
    /// Names of equipment the vehicle is equipped with.
    public var equipments: [AAProperty<String>]?
    
    /// Gearbox value.
    public var gearbox: AAProperty<Gearbox>?
    
    /// The language on headunit.
    public var language: AAProperty<String>?
    
    /// The license plate number.
    public var licensePlate: AAProperty<String>?
    
    /// The vehicle model name.
    public var modelName: AAProperty<String>?
    
    /// The vehicle model manufacturing year number.
    public var modelYear: AAProperty<UInt16>?
    
    /// The vehicle name (nickname).
    public var name: AAProperty<String>?
    
    /// The number of doors.
    public var numberOfDoors: AAProperty<UInt8>?
    
    /// The number of seats.
    public var numberOfSeats: AAProperty<UInt8>?
    
    /// The power of the vehicle.
    public var power: AAProperty<Measurement<UnitPower>>?
    
    /// Powertrain value.
    public var powertrain: AAProperty<Powertrain>?
    
    /// The sales designation of the model.
    public var salesDesignation: AAProperty<String>?
    
    /// The timeformat on headunit.
    public var timeformat: AAProperty<Timeformat>?
    
    // Deprecated
    
    /// The power of the vehicle.
    ///
    /// - warning: This property is deprecated in favour of *power*.
    @available(*, deprecated, renamed: "power", message: "removed the unit from the name")
    public var powerInKW: AAProperty<Measurement<UnitPower>>? {
        power
    }


    // MARK: Getters
    
    /// Get `AAVehicleInformation` state (all properties).
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getVehicleInformation() -> [UInt8] {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + AACommandType.get.rawValue.bytes
    }
    
    /// Get `AAVehicleInformation` state's specific properties.
    ///
    /// - parameters:
    ///     - ids: List of property identifiers to request.
    ///
    /// - returns: The request as `[UInt8]` to send to the vehicle.
    public static func getVehicleInformationProperties(ids: PropertyIdentifier...) -> [UInt8] {
        getVehicleInformation() + ids.map { $0.rawValue }
    }


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        colourName = extract(property: .colourName)
        displayUnit = extract(property: .displayUnit)
        drive = extract(property: .drive)
        driverSeatLocation = extract(property: .driverSeatLocation)
        engineMaxTorque = extract(property: .engineMaxTorque)
        engineVolume = extract(property: .engineVolume)
        equipments = extract(properties: .equipments)
        gearbox = extract(property: .gearbox)
        language = extract(property: .language)
        licensePlate = extract(property: .licensePlate)
        modelName = extract(property: .modelName)
        modelYear = extract(property: .modelYear)
        name = extract(property: .name)
        numberOfDoors = extract(property: .numberOfDoors)
        numberOfSeats = extract(property: .numberOfSeats)
        power = extract(property: .power)
        powertrain = extract(property: .powertrain)
        salesDesignation = extract(property: .salesDesignation)
        timeformat = extract(property: .timeformat)
    }
}
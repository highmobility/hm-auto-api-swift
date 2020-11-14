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
//  AAHomeChargerTests.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities
import XCTest
@testable import AutoAPI


final class AAHomeChargerTests: XCTestCase {

    // MARK: State Properties
    
    func testChargingStatus() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x01, 0x00, 0x04, 0x01, 0x00, 0x01, 0x02]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.chargingStatus?.value, AAHomeCharger.ChargingStatus.charging)
    }
    
    func testAuthenticationMechanism() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x02, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.authenticationMechanism?.value, AAHomeCharger.AuthenticationMechanism.app)
    }
    
    func testPlugType() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x03, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.plugType?.value, AAHomeCharger.PlugType.type2)
    }
    
    func testSolarCharging() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x05, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.solarCharging?.value, AAActiveState.active)
    }
    
    func testWifiHotspotEnabled() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x08, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.wifiHotspotEnabled?.value, AAEnabledState.enabled)
    }
    
    func testWifiHotspotSSID() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x09, 0x00, 0x0f, 0x01, 0x00, 0x0c, 0x43, 0x68, 0x61, 0x72, 0x67, 0x65, 0x72, 0x20, 0x37, 0x36, 0x31, 0x32]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.wifiHotspotSSID?.value, "Charger 7612")
    }
    
    func testWiFiHotspotSecurity() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x0a, 0x00, 0x04, 0x01, 0x00, 0x01, 0x03]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.wiFiHotspotSecurity?.value, AANetworkSecurity.wpa2Personal)
    }
    
    func testWiFiHotspotPassword() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x0b, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x5a, 0x57, 0x33, 0x76, 0x41, 0x52, 0x4e, 0x55, 0x42, 0x65]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.wiFiHotspotPassword?.value, "ZW3vARNUBe")
    }
    
    func testAuthenticationState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x0d, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.authenticationState?.value, AAHomeCharger.AuthenticationState.authenticated)
    }
    
    func testChargeCurrent() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x0e, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x09, 0x00, 0x3f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.chargeCurrent?.value, Measurement<UnitElectricCurrent>(value: 0.5, unit: .amperes))
    }
    
    func testMaximumChargeCurrent() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x0f, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x09, 0x00, 0x3f, 0xf0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.maximumChargeCurrent?.value, Measurement<UnitElectricCurrent>(value: 1.0, unit: .amperes))
    }
    
    func testMinimumChargeCurrent() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x10, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x09, 0x00, 0x3f, 0xb9, 0x99, 0x99, 0x99, 0x99, 0x99, 0x9a]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.minimumChargeCurrent?.value, Measurement<UnitElectricCurrent>(value: 0.1, unit: .amperes))
    }
    
    func testCoordinates() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x11, 0x00, 0x13, 0x01, 0x00, 0x10, 0x40, 0x4a, 0x42, 0x8f, 0x9f, 0x44, 0xd4, 0x45, 0x40, 0x2a, 0xcf, 0x56, 0x21, 0x74, 0xc4, 0xce]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.coordinates?.value?.bytes, AACoordinates(latitude: 52.520008, longitude: 13.404954).bytes)
    }
    
    func testPriceTariffs() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x12, 0x00, 0x11, 0x01, 0x00, 0x0e, 0x00, 0x40, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x45, 0x55, 0x52, 0x12, 0x00, 0x11, 0x01, 0x00, 0x0e, 0x01, 0x3f, 0xd3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x00, 0x03, 0x45, 0x55, 0x52, 0x12, 0x00, 0x14, 0x01, 0x00, 0x11, 0x02, 0x3f, 0xd3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x00, 0x06, 0x52, 0x69, 0x70, 0x70, 0x6c, 0x65]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        guard let priceTariffs = capability.priceTariffs?.compactMap({ $0.value }) else {
            return XCTFail("Could not get `.priceTariffs` values from `AAHomeCharger` capability")
        }
        
        XCTAssertTrue(priceTariffs.contains { $0.bytes == AAPriceTariff(pricingType: .startingFee, price: 4.5, currency: "EUR").bytes })
        XCTAssertTrue(priceTariffs.contains { $0.bytes == AAPriceTariff(pricingType: .perMinute, price: 0.3, currency: "EUR").bytes })
        XCTAssertTrue(priceTariffs.contains { $0.bytes == AAPriceTariff(pricingType: .perKwh, price: 0.3, currency: "Ripple").bytes })
    }
    
    func testChargingPower() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x13, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x14, 0x02, 0x40, 0x75, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let capability = try? AAAutoAPI.parseBytes(bytes) as? AAHomeCharger else {
            return XCTFail("Could not parse bytes as `AAHomeCharger`")
        }
        
        XCTAssertEqual(capability.chargingPower?.value, Measurement<UnitPower>(value: 350.0, unit: .kilowatts))
    }


    // MARK: Non-state or Deprecated Properties
    
    func testChargingPowerKW() {
        let bytes: [UInt8] = [0x04, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x14, 0x02, 0x40, 0x27, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        
        guard let property: AAProperty<Measurement<UnitPower>> = AAOpaqueProperty(bytes: bytes)?.property() else {
            return XCTFail("Could not create a property for `.chargingPowerKW`")
        }
        
        XCTAssertEqual(property.value, Measurement<UnitPower>(value: 11.5, unit: .kilowatts))
    }


    // MARK: Getters
    
    func testGetHomeChargerState() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x00]
        
        XCTAssertEqual(bytes, AAHomeCharger.getHomeChargerState())
    }
    
    func testGetHomeChargerStateAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x02]
        
        XCTAssertEqual(bytes, AAHomeCharger.getHomeChargerStateAvailability())
    }
    
    func testGetHomeChargerStateProperties() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x00, 0x01]
        let getterBytes = AAHomeCharger.getHomeChargerStateProperties(ids: .chargingStatus)
        
        XCTAssertEqual(bytes, getterBytes)
    }
    
    func testGetHomeChargerStatePropertiesAvailability() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x02, 0x01]
        let getterBytes = AAHomeCharger.getHomeChargerStatePropertiesAvailability(ids: .chargingStatus)
        
        XCTAssertEqual(bytes, getterBytes)
    }


    // MARK: Setters
    
    func testSetChargeCurrent() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x0e, 0x00, 0x0d, 0x01, 0x00, 0x0a, 0x09, 0x00, 0x3f, 0xe0, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        let setterBytes = AAHomeCharger.setChargeCurrent(chargeCurrent: Measurement<UnitElectricCurrent>(value: 0.5, unit: .amperes))
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testSetPriceTariffs() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x12, 0x00, 0x11, 0x01, 0x00, 0x0e, 0x00, 0x40, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x45, 0x55, 0x52, 0x12, 0x00, 0x11, 0x01, 0x00, 0x0e, 0x01, 0x3f, 0xd3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x00, 0x03, 0x45, 0x55, 0x52, 0x12, 0x00, 0x14, 0x01, 0x00, 0x11, 0x02, 0x3f, 0xd3, 0x33, 0x33, 0x33, 0x33, 0x33, 0x33, 0x00, 0x06, 0x52, 0x69, 0x70, 0x70, 0x6c, 0x65]
        let setterBytes = AAHomeCharger.setPriceTariffs(priceTariffs: [AAPriceTariff(pricingType: .startingFee, price: 4.5, currency: "EUR"), AAPriceTariff(pricingType: .perMinute, price: 0.3, currency: "EUR"), AAPriceTariff(pricingType: .perKwh, price: 0.3, currency: "Ripple")])
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testActivateDeactivateSolarCharging() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x05, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAHomeCharger.activateDeactivateSolarCharging(solarCharging: AAActiveState.active)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testEnableDisableWiFiHotspot() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x08, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAHomeCharger.enableDisableWiFiHotspot(wifiHotspotEnabled: AAEnabledState.enabled)
        
        XCTAssertEqual(bytes, setterBytes)
    }
    
    func testAuthenticateExpire() {
        let bytes: [UInt8] = [0x0c, 0x00, 0x60, 0x01, 0x0d, 0x00, 0x04, 0x01, 0x00, 0x01, 0x01]
        let setterBytes = AAHomeCharger.authenticateExpire(authenticationState: AAHomeCharger.AuthenticationState.authenticated)
        
        XCTAssertEqual(bytes, setterBytes)
    }


    // MARK: Identifiers
    
    func testCapabilityIdentifier() {
        XCTAssertEqual(AAHomeCharger.identifier, 0x0060)
    }
    
    func testPropeertyIdentifiers() {
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.chargingStatus.rawValue, 0x01)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.authenticationMechanism.rawValue, 0x02)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.plugType.rawValue, 0x03)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.solarCharging.rawValue, 0x05)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.wifiHotspotEnabled.rawValue, 0x08)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.wifiHotspotSSID.rawValue, 0x09)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.wiFiHotspotSecurity.rawValue, 0x0a)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.wiFiHotspotPassword.rawValue, 0x0b)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.authenticationState.rawValue, 0x0d)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.chargeCurrent.rawValue, 0x0e)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.maximumChargeCurrent.rawValue, 0x0f)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.minimumChargeCurrent.rawValue, 0x10)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.coordinates.rawValue, 0x11)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.priceTariffs.rawValue, 0x12)
        XCTAssertEqual(AAHomeCharger.PropertyIdentifier.chargingPower.rawValue, 0x13)
    }
}
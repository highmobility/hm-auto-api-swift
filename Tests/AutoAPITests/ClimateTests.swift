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
//  ClimateTests.swift
//  AutoAPITests
//
//  Created by Mikk Rätsep on 30/11/2017.
//

import AutoAPI
import XCTest


class ClimateTests: XCTestCase {

    static var allTests = [("testGetState", testGetState),
                           ("testSetClimateProfile", testSetClimateProfile),
                           ("testStartStopDefogging", testStartStopDefogging),
                           ("testStartStopDefrosting", testStartStopDefrosting),
                           ("testStartStopHVAC", testStartStopHVAC),
                           ("testStartStopIonising", testStartStopIonising),
                           ("testState", testState)]


    // MARK: XCTestCase

    func testGetState() {
        let bytes: [UInt8] = [
            0x00, 0x24, // MSB, LSB Message Identifier for Climate
            0x00        // Message Type for Get Climate State
        ]

        XCTAssertEqual(Climate.getClimateState, bytes)
    }

    func testSetClimateProfile() {
        let bytes: [UInt8] = [
            0x00, 0x24, // MSB, LSB Message Identifier for Climate
            0x02,       // Message Type for Set Climate Profile

            0x01,       // Property Identifier for Climate Profile
            0x00, 0x0F, // Property size is 15 bytes

            0x60,       // Auto-HVAC activated for Saturdays and Sundays
            0x00, 0x00, // Monday not set 00:00
            0x00, 0x00, // Tueday not set 00:00
            0x00, 0x00, // Wednesday not set 00:00
            0x00, 0x00, // Thursday not set 00:00
            0x00, 0x00, // Friday not set 00:00
            0x07, 0x1E, // Saturday set to 07:30
            0x07, 0x1E, // Sunday set to 07:30

            0x02,                   // Property Identifier for Driver Temperature
            0x00, 0x04,             // Property size is 4 bytes
            0x41, 0xac, 0x00, 0x00, // Driver temperature setting 21.5C

            0x03,                   // Property Identifier for Passenger Temperature
            0x00, 0x04,             // Property size is 4 bytes
            0x41, 0xac, 0x00, 0x00  // Passenger temperature setting 21.5C
        ]

        let sevenThirty = DayTime(hour: 7, minute: 30)
        let weekdays = WeekdaysTimes(monday: DayTime.zero, tuesday: DayTime.zero, wednesday: DayTime.zero, thursday: DayTime.zero, friday: DayTime.zero, saturday: sevenThirty, sunday: sevenThirty)
        let climateProfile = ClimateProfile(activatedDays: [.saturday, .sunday], weekdaysStartingTimes: weekdays)
        let settings = Climate.Settings(climateProfile: climateProfile, driverTemp: 21.5, passengerTemp: 21.5)

        XCTAssertEqual(Climate.setClimateProfile(settings), bytes)
    }

    func testStartStopDefogging() {
        let bytes: [UInt8] = [
            0x00, 0x24, // MSB, LSB Message Identifier for Climate
            0x04,       // Message Type for Start/Stop Defogging
            0x01        // Activate
        ]

        XCTAssertEqual(Climate.startDefogging(true), bytes)
    }

    func testStartStopDefrosting() {
        let bytes: [UInt8] = [
            0x00, 0x24, // MSB, LSB Message Identifier for Climate
            0x05,       // Message Type for Start/Stop Defrosting
            0x01        // Activate
        ]

        XCTAssertEqual(Climate.startDefrosting(true), bytes)
    }

    func testStartStopHVAC() {
        let bytes: [UInt8] = [
            0x00, 0x24, // MSB, LSB Message Identifier for Climate
            0x03,       // Message Type for Start/Stop HVAC
            0x01        // Activate
        ]

        XCTAssertEqual(Climate.startHVAC(true), bytes)
    }

    func testStartStopIonising() {
        let bytes: [UInt8] = [
            0x00, 0x24, // MSB, LSB Message Identifier for Climate
            0x06,       // Message Type for Start/Stop Ionising
            0x01        // Activate
        ]

        XCTAssertEqual(Climate.startIonising(true), bytes)
    }

    func testState() {
        let bytes: [UInt8] = [
            0x00, 0x24, // MSB, LSB Message Identifier for Climate
            0x01,       // Message Type for Climate State

            0x01,                   // Property Identifier for Inside Temperature
            0x00, 0x04,             // Property size 4 bytes
            0x41, 0x98, 0x00, 0x00, // Inside temperature 19C

            0x02,                   // Property Identifier for Outside Temperature
            0x00, 0x04,             // Property size 4 bytes
            0x41, 0x40, 0x00, 0x00, // Outside temperature 12C

            0x03,                   // Property Identifier for Driver temperature setting
            0x00, 0x04,             // Property size 4 bytes
            0x41, 0xac, 0x00, 0x00, // Driver temperature setting 21.5C

            0x04,                   // Property Identifier for Passenger temperature setting
            0x00, 0x04,             // Property size 4 bytes
            0x41, 0xac, 0x00, 0x00, // Passenger temperature setting 21.5C

            0x05,       // Property Identifier for HVAC state
            0x00, 0x01, // Property size 1 byte
            0x01,       // HVAC activated

            0x06,       // Property Identifier for Defogging state
            0x00, 0x01, // Property size 1 byte
            0x00,       // Defogging deactivated

            0x07,       // Property Identifier for Defrosting state
            0x00, 0x01, // Property size 1 byte
            0x00,       // Defrosting deactivated

            0x08,       // Property Identifier for Ionising state
            0x00, 0x01, // Property size 1 byte
            0x00,       // Ionising deactivated

            0x09,                   // Property Identifier for Defrosting Temperature
            0x00, 0x04,             // Property size 4 bytes
            0x41, 0xac, 0x00, 0x00, // Defrosting temperature at 21.5C

            0x0A,       // Property Identifier for HVAC Profile
            0x00, 0x0F, // Property size 15 bytes

            0x60,   // Auto-HVAC activated for Saturdays and Sundays

            0x00, 0x00, // Monday not set 00:00
            0x00, 0x00, // Tueday not set 00:00
            0x00, 0x00, // Wednesday not set 00:00
            0x00, 0x00, // Thursday not set 00:00
            0x00, 0x00, // Friday not set 00:00
            0x07, 0x1E, // Saturday set to 07:30
            0x07, 0x1E  // Sunday set to 07:30
        ]

        guard let climate = AAAutoAPI.parseBinary(bytes) as? Climate else {
            return XCTFail("Parsed value is not Climate")
        }

        XCTAssertEqual(climate.insideTemperature, 19.0)
        XCTAssertEqual(climate.outsideTemperature, 12.0)
        XCTAssertEqual(climate.driverTemperature, 21.5)
        XCTAssertEqual(climate.passengerTemperature, 21.5)
        XCTAssertEqual(climate.isHVACActive, true)
        XCTAssertEqual(climate.isDefoggingActive, false)
        XCTAssertEqual(climate.isDefrostingActive, false)
        XCTAssertEqual(climate.isIonisingActive, false)
        XCTAssertEqual(climate.defrostingTemperature, 21.5)

        if let hvacProfile = climate.climateProfile {
            XCTAssertTrue(hvacProfile.activatedDays.contains(.saturday))
            XCTAssertTrue(hvacProfile.activatedDays.contains(.sunday))

            let startingTimes = hvacProfile.weekdaysStartingTimes

            XCTAssertEqual(startingTimes.monday.hour, 0)
            XCTAssertEqual(startingTimes.monday.minute, 0)
            XCTAssertEqual(startingTimes.tuesday.hour, 0)
            XCTAssertEqual(startingTimes.tuesday.minute, 0)
            XCTAssertEqual(startingTimes.wednesday.hour, 0)
            XCTAssertEqual(startingTimes.wednesday.minute, 0)
            XCTAssertEqual(startingTimes.thursday.hour, 0)
            XCTAssertEqual(startingTimes.thursday.minute, 0)
            XCTAssertEqual(startingTimes.friday.hour, 0)
            XCTAssertEqual(startingTimes.friday.minute, 0)
            XCTAssertEqual(startingTimes.saturday.hour, 7)
            XCTAssertEqual(startingTimes.saturday.minute, 30)
            XCTAssertEqual(startingTimes.sunday.hour, 7)
            XCTAssertEqual(startingTimes.sunday.minute, 30)
        }
        else {
            XCTFail("Climate does not contain Auto HVAC Profile")
        }
    }
}

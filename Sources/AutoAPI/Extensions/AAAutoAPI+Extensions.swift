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
//  AAAutoAPI+Extensions.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation


extension AAAutoAPI {

    static let capabilities: [AACapability.Type] = [
            AAAdas.self,
		    AABrowser.self,
		    AACapabilities.self,
		    AACharging.self,
		    AAChargingSession.self,
		    AAChassisSettings.self,
		    AAClimate.self,
		    AACrash.self,
		    AACruiseControl.self,
		    AADashboardLights.self,
		    AADiagnostics.self,
		    AADoors.self,
		    AADriverFatigue.self,
		    AAEngine.self,
		    AAFailureMessage.self,
		    AAFirmwareVersion.self,
		    AAFueling.self,
		    AAGraphics.self,
		    AAHeartRate.self,
		    AAHistorical.self,
		    AAHomeCharger.self,
		    AAHonkHornFlashLights.self,
		    AAHood.self,
		    AAIgnition.self,
		    AAKeyfobPosition.self,
		    AALightConditions.self,
		    AALights.self,
		    AAMaintenance.self,
		    AAMessaging.self,
		    AAMobile.self,
		    AAMultiCommand.self,
		    AANaviDestination.self,
		    AANotifications.self,
		    AAOffroad.self,
		    AAParkingBrake.self,
		    AAParkingTicket.self,
		    AAPowerTakeoff.self,
		    AARace.self,
		    AARemoteControl.self,
		    AARooftopControl.self,
		    AASeats.self,
		    AATachograph.self,
		    AATextInput.self,
		    AATheftAlarm.self,
		    AATrips.self,
		    AATrunk.self,
		    AAUsage.self,
		    AAValetMode.self,
		    AAVehicleInformation.self,
		    AAVehicleLocation.self,
		    AAVehicleStatus.self,
		    AAVehicleTime.self,
		    AAVideoHandover.self,
		    AAWakeUp.self,
		    AAWeatherConditions.self,
		    AAWiFi.self,
		    AAWindows.self,
		    AAWindscreen.self
    ]


    static let protocolVersion: UInt8 = 0x0d
}

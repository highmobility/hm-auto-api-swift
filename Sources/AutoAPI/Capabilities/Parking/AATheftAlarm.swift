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
//  AATheftAlarm.swift
//  AutoAPI
//
//  Created by Mikk Rätsep on 13/01/2020.
//  Copyright © 2020 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public class AATheftAlarm: AACapability {

    /// Status
    public enum Status: UInt8, AABytesConvertable {
        case unarmed = 0x00
        case armed = 0x01
        case triggered = 0x02
    
        static let unarm = Self.unarmed
        static let arm = Self.armed
        static let trigger = Self.triggered
    }


    /// Property Identifiers for `AATheftAlarm` capability.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case status = 0x01
    }


    // MARK: Properties
    
    /// Status
    ///
    /// - returns: `Status` wrapped in `AAProperty<Status>`
    public var status: AAProperty<Status>? {
        properties.property(forID: PropertyIdentifier.status)
    }


    // MARK: AAIdentifiable
    
    /// Capability's Identifier
    ///
    /// - returns: `UInt16` combining the MSB and LSB
    public override class var identifier: UInt16 {
        0x0046
    }


    // MARK: Getters
    
    /// Bytes for getting the `AATheftAlarm` state.
    ///
    /// These bytes should be sent to a receiving vehicle (device) to *request* the state of `AATheftAlarm`.
    ///
    /// - returns: Command's bytes as `Array<UInt8>`
    public static func getTheftAlarmState() -> Array<UInt8> {
        AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + [AACommandType.get.rawValue]
    }


    // MARK: Setters
    
    /// Bytes for *set theft alarm* command.
    ///
    /// These bytes should be sent to a receiving vehicle (device) to *set theft alarm* in `AATheftAlarm`.
    /// 
    /// - parameters:
    ///   - status: status as `Status`
    /// - returns: Command's bytes as `Array<UInt8>`
    public static func setTheftAlarm(status: Status) -> Array<UInt8> {
        return AAAutoAPI.protocolVersion.bytes + Self.identifier.bytes + [AACommandType.set.rawValue] + AAProperty(identifier: PropertyIdentifier.status, value: status).bytes
    }


    // MARK: AADebugTreeCapable
    
    public override var propertyNodes: [HMDebugTree] {
        [
            .node(label: "Status", property: status)
        ]
    }
}
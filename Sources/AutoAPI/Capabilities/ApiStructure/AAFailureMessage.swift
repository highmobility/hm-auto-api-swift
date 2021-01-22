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
//  AAFailureMessage.swift
//  AutoAPI
//
//  Generated by AutoAPIGenerator for Swift.
//  Copyright © 2021 High-Mobility GmbH. All rights reserved.
//

import Foundation
import HMUtilities


public final class AAFailureMessage: AACapability, AAPropertyIdentifying {

    public typealias FailureReason = AAFailureMessageFailureReason


    /// Information about the introduction and last update of this capability.
    public enum API: AAAPICurrent {
        /// Level (version) of *AutoAPI* when `AAFailureMessage` was introduced to the spec.
        public static let intro: UInt8 = 2
    
        /// Level (version) of *AutoAPI* when `AAFailureMessage` was last updated.
        public static let updated: UInt8 = 11
    }


    // MARK: Identifiers
    
    public class override var identifier: UInt16 { 0x0002 }


    /// Property identifiers for `AAFailureMessage`.
    public enum PropertyIdentifier: UInt8, CaseIterable {
        case failedMessageID = 0x01
        case failedMessageType = 0x02
        case failureReason = 0x03
        case failureDescription = 0x04
        case failedPropertyIDs = 0x05
    }


    // MARK: Properties
    
    /// Capability identifier of the failed message.
    public var failedMessageID: AAProperty<UInt16>?
    
    /// Message type of the failed message.
    public var failedMessageType: AAProperty<UInt8>?
    
    /// Array of failed property identifiers.
    public var failedPropertyIDs: AAProperty<[UInt8]>?
    
    /// Failure description.
    public var failureDescription: AAProperty<String>?
    
    /// Failure reason value.
    public var failureReason: AAProperty<FailureReason>?


    // MARK: AACapability
    
    public required init?(bytes: [UInt8]) {
        super.init(bytes: bytes)
    
        failedMessageID = extract(property: .failedMessageID)
        failedMessageType = extract(property: .failedMessageType)
        failedPropertyIDs = extract(property: .failedPropertyIDs)
        failureDescription = extract(property: .failureDescription)
        failureReason = extract(property: .failureReason)
    }
}

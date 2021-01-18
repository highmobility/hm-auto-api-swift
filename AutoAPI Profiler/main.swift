//
//  main.swift
//  AutoAPI Profiler
//
//  Created by Mikk Rätsep on 30/04/2019.
//  Copyright © 2019 High Mobility GmbH. All rights reserved.
//

import AutoAPI
import Foundation


let base64Str = "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"

let data = Data(base64Encoded: base64Str)

precondition(data != nil)

let _ = AutoAPI.parseBinary(data!)

//
//  DarkSkyError.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/27/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case responseFailed
    case invalidUrl
    case responseUnsuccessful
    case unableToParseJson
    case invalidData
    case failedToCaptureData
}

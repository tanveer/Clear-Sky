//
//  Constants.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

let baseUrl = "https://api.darksky.net/forecast/"

var apiKey = "<your apiKey heer>" // get one from https://darksky.net/dev

var now: Date {
    return Date()
}

var dateFormatter: DateFormatter {
    return DateFormatter()
}

var isSimulator: Bool {
    return TARGET_OS_SIMULATOR != 0
}

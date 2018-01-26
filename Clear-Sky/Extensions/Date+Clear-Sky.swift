//
//  Date+Clear-Sky.swift
//  Clear-Sky
//
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

extension Date {
func dateFromUnixTime(_ unixTime: TimeInterval) -> Date {
        return Date(timeIntervalSince1970: unixTime)
    }

    var day: String {
        let dateFormatter = DateFormatter(dateFormat: "EEEE")
        return dateFormatter.string(from: self)
    }

    var time: String {
        let dateFormatter = DateFormatter(dateFormat: "hh a")
        return dateFormatter.string(from: self)
    }
}

extension DateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}


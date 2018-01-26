//
//  Double+Clear-Sky.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/25/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

extension Double {
    var round: String {
        return String(Int(self.rounded()))
    }
}

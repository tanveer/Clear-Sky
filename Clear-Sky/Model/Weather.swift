//
//  Weather.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

class Weather: Mappable {

    var latitude: Double!
    var longitude: Double!
    var timezone: String!
    var currently: Currently!
    var hourly: Hourly!
    var daily: Daily!
    var offset: Int!


    required init?(map: Map) {
    }

    func mapping(map: Map) {
        latitude    <- map["latitude"]
        longitude   <- map["longitude"]
        timezone    <- map["timezone"]
        currently   <- map["currently"]
        hourly      <- map["hourly"]
        daily       <- map["daily"]
        offset      <- map["offset"]
    }
}

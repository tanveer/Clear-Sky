//
//  Hourly.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import ObjectMapper

class Hourly: Weather {
    var summary: String!
    var icon: String!
    var data: [HourlyData]!

    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        
        summary                 <- map["summary"]
        icon                    <- map["icon"]
        data                    <- map["data"]
    }
}

class HourlyData: Mappable {
    var time: Int!
    var summary: String!
    var icon: String!
    var nearestStormDistance: Int!
    var nearestStormBearing: Int!
    var precipIntensity: Int!
    var precipProbability: Int!
    var temperature: Double!
    var apparentTemperature: Double!
    var dewPoint: Double!
    var humidity: Double!
    var pressure: Double!
    var windSpeed: Double!
    var windGust: Double!
    var windBearing: Double!
    var cloudCover: Double!
    var uvIndex: Int!
    var visibility: Int!
    var ozone: Double!

    required init?(map: Map) {  }

    func mapping(map: Map) {

        time                    <- map["time"]
        summary                 <- map["summary"]
        icon                    <- map["icon"]
        nearestStormDistance    <- map["nearestStormDistance"]
        nearestStormBearing     <- map["nearestStormBearing"]
        precipIntensity         <- map["precipIntensity"]
        precipProbability       <- map["precipProbability"]
        temperature             <- map["temperature"]
        apparentTemperature     <- map["apparentTemperature"]
        dewPoint                <- map["dewPoint"]
        humidity                <- map["humidity"]
        pressure                <- map["pressure"]
        windSpeed               <- map["windSpeed"]
        windGust                <- map["windGust"]
        windBearing             <- map["windBearing"]
        cloudCover              <- map["cloudCover"]
        uvIndex                 <- map["uvIndex"]
        visibility              <- map["visibility"]
        ozone                   <- map["ozone"]
    }
}

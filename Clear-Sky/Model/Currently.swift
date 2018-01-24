//
//  Currently.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on //.
//  Copyright ©  Tanveer Bashir. All rights reserved.
//

import Foundation
import ObjectMapper


class Currently: Mappable {
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

    required init?(map: Map) {}

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


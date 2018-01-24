//
//  Daily.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import ObjectMapper


class Daily: Weather {

    var summary: String!
    var icon: String!
    var data: [DailyData]!


    required init?(map: Map) {
        super.init(map: map)
    }

    override func mapping(map: Map) {
        super.mapping(map: map)

        summary     <- map["summary"]
        icon        <- map["icon"]
        data        <- map["data"]
    }
}
class DailyData: Mappable {
    var time: Int!
    var summary: String!
    var icon: String!
    var nearestStormDistance: Int!
    var nearestStormBearing: Int!
    var precipIntensity: Int!
    var precipProbability: Int!
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
    var sunriseTime: Int!
    var sunsetTime: Int!
    var moonPhase: Double!
    var precipIntensityMax: Double!
    var precipIntensityMaxTime: Double!
    var precipType: String!
    var temperatureHigh: Double!
    var temperatureHighTime: Int!
    var temperatureLow: Double!
    var temperatureLowTime: Int!
    var apparentTemperatureHigh: Double!
    var apparentTemperatureHighTime: Int!
    var apparentTemperatureLow: Double!
    var apparentTemperatureLowTime: Int!
    var windGustTime: Int!
    var uvIndexTime: Int!
    var temperatureMin: Double!
    var temperatureMinTime: Int!
    var temperatureMax: Double!
    var temperatureMaxTime: Double!
    var apparentTemperatureMin: Double!
    var apparentTemperatureMinTime: Int!
    var apparentTemperatureMax: Double!
    var apparentTemperatureMaxTime: Int!


    required init?(map: Map) {}

     func mapping(map: Map) {

        time                        <- map["time"]
        summary                     <- map["summary"]
        icon                        <- map["icon"]
        nearestStormDistance        <- map["nearestStormDistance"]
        nearestStormBearing         <- map["nearestStormBearing"]
        precipIntensity             <- map["precipIntensity"]
        precipProbability           <- map["precipProbability"]
        dewPoint                    <- map["dewPoint"]
        humidity                    <- map["humidity"]
        pressure                    <- map["pressure"]
        windSpeed                   <- map["windSpeed"]
        windGust                    <- map["windGust"]
        windBearing                 <- map["windBearing"]
        cloudCover                  <- map["cloudCover"]
        uvIndex                     <- map["uvIndex"]
        visibility                  <- map["visibility"]
        ozone                       <- map["ozone"]
        sunriseTime                 <- map["sunriseTime"]
        sunsetTime                  <- map["sunsetTime"]
        moonPhase                   <- map["moonPhase"]
        precipIntensityMax          <- map["precipIntensityMax"]
        precipIntensityMaxTime      <- map["precipIntensityMaxTime"]
        precipType                  <- map["precipType"]
        temperatureHigh             <- map["temperatureHigh"]
        temperatureHighTime         <- map["temperatureHighTime"]
        temperatureLow              <- map["temperatureLow"]
        temperatureLowTime          <- map["temperatureLowTime"]
        apparentTemperatureHigh     <- map["apparentTemperatureHigh"]
        apparentTemperatureHighTime <- map["apparentTemperatureHighTime"]
        apparentTemperatureLow      <- map["apparentTemperatureLow"]
        apparentTemperatureLowTime  <- map["apparentTemperatureLowTime"]
        windGustTime                <- map["windGustTime"]
        uvIndexTime                 <- map["uvIndexTime"]
        temperatureMin              <- map["temperatureMin"]
        temperatureMinTime          <- map["temperatureMinTime"]
        temperatureMax              <- map["temperatureMax"]
        temperatureMaxTime          <- map["temperatureMaxTime"]
        apparentTemperatureMin      <- map["apparentTemperatureMin"]
        apparentTemperatureMinTime  <- map["apparentTemperatureMinTime"]
        apparentTemperatureMax      <- map["apparentTemperatureMax"]
        apparentTemperatureMaxTime  <- map["apparentTemperatureMaxTime"]
    }
}

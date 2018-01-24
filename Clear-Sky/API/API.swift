//
//  API.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
var latitude: Double = 0
var longitude: Double = 0

class API {
    class func fetchWeather(onSuccess: @escaping (Hourly) -> Void) {
        guard let apiKey = Helper.apiKey else { return }
        let path = Constants.baseUrl + apiKey + "/\(latitude),\(longitude)?exclude=flags,minutely,alerts"
        print(path.url)
        Alamofire.request(path.url).responseObject { (response: DataResponse<Weather>) in
            switch response.result {
            case .success(let weather):
                onSuccess(weather.hourly)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

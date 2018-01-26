//
//  DarkSkyAPIClient.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation

class DarkSkyAPIClient {
    typealias WeatherCompletionHandler = (Weather?, DarkSkyError?) -> ()
    let download = JsonDownloader()

    private lazy var baseUrl: URL = {
        return URL(string: "\(Constants.baseUrl)\(apiKey)/")!
    }()

    func getCurrentWeather(at coordinate: Coordinate, completionHandler completion: @escaping WeatherCompletionHandler) {
        guard let url = URL(string: coordinate.description, relativeTo: baseUrl) else {
            completion(nil, .invalidUrl)
            return
        }
        let request = URLRequest(url: url)
        let task = download.jsonTask(with: request) { (weather, error) in
            guard let weather = weather else {
                completion(nil, .failedToCaptureData)
                return
            }
            DispatchQueue.main.async {
                completion(weather, nil)
            }
        }
        task.resume()
    }
}

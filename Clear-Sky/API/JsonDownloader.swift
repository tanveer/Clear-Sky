//
//  JsonDownloader.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/27/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation


class JsonDownloader {
    typealias CompletionHandler = (Weather?, DarkSkyError?) -> ()
    private let session: URLSession

    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    func jsonTask(with request: URLRequest, completionHandler: @escaping CompletionHandler ) -> URLSessionDataTask {
        let task = session.dataTask(with: request ) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else {
                completionHandler(nil, .responseFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                        let weather = Weather(JSON: json!).self
                        completionHandler(weather, nil)
                    } catch {
                        completionHandler(nil, .unableToParseJson)
                    }
                } else {
                    completionHandler(nil, .invalidData)
                }
            } else {
                completionHandler(nil, .responseUnsuccessful)
            }
        }
        return task
    }
}

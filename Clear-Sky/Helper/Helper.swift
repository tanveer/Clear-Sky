//
//  Helper.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/23/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
class Helper {
    static var apiKey: String {
        guard let filepath = Bundle.main.path(forResource: "ApiKey", ofType: "plist"),
            let plist = NSDictionary(contentsOfFile: filepath),
            let value = plist.object(forKey: "API_KEY") else { print("Unable to locate file1"); return }
        return value as! String
    }
}


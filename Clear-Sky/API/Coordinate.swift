//
//  Coordinate.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/27/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import Foundation
import CoreLocation

struct Coordinate {
    let coordinate: CLLocationCoordinate2D
}

extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(coordinate.latitude),\(coordinate.longitude)"
    }
}

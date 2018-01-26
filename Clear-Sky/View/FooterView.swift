//
//  FooterView.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/25/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class FooterView: UIView {
    var weather: Weather? {
        didSet{
            if let weather = weather {
                updateUI(with: weather)
            }
        }
    }
    
    @IBOutlet private weak var summaryLabel: UILabel!
    @IBOutlet private weak var sunriseLabel: UILabel!
    @IBOutlet private weak var sunsetLabel: UILabel!
    @IBOutlet private weak var precipLabel: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var windLabel: UILabel!
    @IBOutlet private weak var feelsLikeLabel: UILabel!
    @IBOutlet private weak var precipitationLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var uvIndexLabel: UILabel!
    @IBOutlet private weak var visibilityLabel: UILabel!

    private func updateUI(with weather: Weather) {
        let pressure = weather.currently.pressure / 33.86
        summaryLabel.text = weather.daily.summary
        humidityLabel.text = "\(weather.currently.humidity * 100)%"
        windLabel.text = "\(weather.currently.windSpeed.round) mph"
        precipitationLabel.text = "\(weather.currently.precipProbability ?? 0) %"
        pressureLabel.text = "\(pressure.round) inHg"
        visibilityLabel.text = "\(weather.currently.visibility ?? 0) mph"
        uvIndexLabel.text = "\(weather.currently.uvIndex ?? 0)"
    }
}

extension FooterView {
    static var id: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}

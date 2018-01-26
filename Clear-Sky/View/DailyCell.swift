//
//  DailyCell.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/25/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class DailyCell: UITableViewCell {

    var dailyData: DailyData? {
        didSet{
            if let dailyData = dailyData {
                dayLabel.text = now.dateFromUnixTime(dailyData.time.unixTime).day
                iconImageView.image = UIImage(named: dailyData.icon)
                tempHighLabel.text = dailyData.temperatureHigh.round
                tempLowLabel.text = dailyData.temperatureLow.round

            }
        }
    }

    @IBOutlet weak var tempHighLabel: UILabel!
    @IBOutlet weak var tempLowLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
}

extension DailyCell {
    static var id: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}

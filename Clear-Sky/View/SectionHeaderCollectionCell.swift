//
//  SectionHeaderCollectionCell.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/24/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit


class SectionHeaderCollectionCell: UICollectionViewCell {
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!

    func configure(data: HourlyData, indexPath: IndexPath) {
        tempLabel.text = data.temperature == nil ? "0" : "\(data.temperature.round)º"
        iconImageView.image = UIImage(named: data.icon)
        let time = now.dateFromUnixTime(data.time.unixTime).time
        timeLabel.text = time.uppercased()
    }
}

extension SectionHeaderCollectionCell{
    static var id: String{
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: id, bundle: nil)
    }
}

//
//  SectionHeaderCollectionCell.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/24/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class SectionHeaderCollectionCell: UICollectionViewCell {
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!

    func configure(data: HourlyData) {
        tempLabel.text = "\(data.temperature ?? 0)"
        minTempLabel.text = "\(data.apparentTemperature ?? 0)"
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

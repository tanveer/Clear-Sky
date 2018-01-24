//
//  SectionHeader.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/24/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit


class SectionHeader: UIView {
    func sectionHeaderView(hourly: [HourlyData]) -> UIView {
        if let sectionView = Bundle.main.loadNibNamed(SectionHeaderView.id, owner: self, options: nil)?.first as? SectionHeaderView {
            sectionView.configure(hourlyData: hourly)
            return sectionView
        } else {
            return UIView()
        }
    }
}


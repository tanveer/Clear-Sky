//
//  SectionFooterView.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/25/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class SectionFooterView: UIView {
    class func getFooterView(for weather: Weather) -> UIView {
        if let view = Bundle.main.loadNibNamed(FooterView.id, owner: self, options: nil)?.first as? FooterView {
            view.weather = weather
            return view
        } else {
            return UIView()
        }
    }
}

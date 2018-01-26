//
//  SectionHeaderView.swift
//  Clear-Sky
//
//  Created by Tanveer Bashir on 1/24/18.
//  Copyright © 2018 Tanveer Bashir. All rights reserved.
//

import UIKit

class SectionHeaderView: UIView {
    @IBOutlet private weak var collectionVIew: UICollectionView! {
        didSet{
            collectionVIew.dataSource = self
            collectionVIew.register(SectionHeaderCollectionCell.nib, forCellWithReuseIdentifier: SectionHeaderCollectionCell.id)
        }
    }

    private var hourlyData: [HourlyData]?
    func configure(hourlyData: [HourlyData]) {
        self.hourlyData = hourlyData
        collectionVIew.reloadData()
    }
}

extension SectionHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hourlyData?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionHeaderCollectionCell.id, for: indexPath) as! SectionHeaderCollectionCell
        cell.configure(data: (hourlyData?[indexPath.row])!, indexPath: indexPath)
        return cell
    }
}

extension SectionHeaderView {
    static var id: String {
        return String(describing: self)
    }
}

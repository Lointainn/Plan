//
//  MonthCell.swift
//  Plan
//
//  Created by Wu on 12/29.
//  Copyright © 2017年 Wu. All rights reserved.
//

import UIKit

class MonthCell: UICollectionViewCell {
    
    @IBOutlet weak var dayCollection: UICollectionView!
    
    override func awakeFromNib() {
        
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (dayCollection.bounds.width - 10)/7, height: (dayCollection.bounds.height-200)/6)
        layout.headerReferenceSize = CGSize(width: dayCollection.bounds.width, height: 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        dayCollection.collectionViewLayout = layout
    }
}

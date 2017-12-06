//
//  CollectionViewCell.swift
//  Plan
//
//  Created by Wu on 12/6.
//  Copyright © 2017年 Wu. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 1
    }
}

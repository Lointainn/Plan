//
//  MonthCell.swift
//  Plan
//
//  Created by Wu on 12/29.
//  Copyright © 2017年 Wu. All rights reserved.
//

import UIKit

class MonthCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var dayCollection: UICollectionView!
    
    var month: Month?
    
    //autolayout里设置几个串联的view同宽:1.所有的view设置同宽同高,2.所有的view设置好左边距和上边距,3.最后一个view设置好右边距
    override func awakeFromNib() {
        
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (dayCollection.bounds.width - 10)/7, height: (dayCollection.bounds.height-200)/6)
        layout.headerReferenceSize = CGSize(width: dayCollection.bounds.width, height: 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        dayCollection.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: DayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as! DayCell
        cell.label.text = "\(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseView: MonthHeader = collectionView .dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "MonthHeader", for: indexPath) as! MonthHeader
        reuseView.monthLabel.text = month?.monthTitle
        return reuseView
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: dayCollection.bounds.width, height: 100)
    }
}

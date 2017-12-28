//
//  ViewController.swift
//  Plan
//
//  Created by Wu on 12/6.
//  Copyright © 2017年 Wu. All rights reserved.
//

import UIKit

let width_screen = UIScreen.main.bounds.width
let height_screen = UIScreen.main.bounds.height

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var backScrollView: UIScrollView!
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var collection2: UICollectionView!
    var lastOffsetX : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (width_screen - 10)/7, height: (height_screen-200)/6)
        layout.headerReferenceSize = CGSize(width: collection.bounds.width, height: 100)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5)
        collection.collectionViewLayout = layout
        collection2.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.label.text = "\(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header : CollectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "collectionHeader", for: indexPath) as! CollectionHeader
        header.monthLabel.text = (collectionView == collection) ? "1" : "2"
        return header
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffsetX = scrollView.contentOffset.x
        
        //向左滑
        if lastOffsetX < currentOffsetX {
            print(currentOffsetX)
            
        } else if lastOffsetX > currentOffsetX {
            print(currentOffsetX)
        }
        
        lastOffsetX = scrollView.contentOffset.x
    }
    

}


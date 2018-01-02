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
    
    @IBOutlet weak var monthCollection: UICollectionView!
    var lastOffsetX: CGFloat = 0.0
    var switchPage: Bool = false
    var pageNum: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == monthCollection {
            return 10
        }
        return 42
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == monthCollection {
            let cell: MonthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! MonthCell
            return cell
        }
        let cell: DayCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath) as! DayCell
        cell.label.text = "\(indexPath.item)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if collectionView == monthCollection {
            return UICollectionReusableView.init()
        }
        let header: MonthHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "MonthHeader", for: indexPath) as! MonthHeader
        header.monthLabel.text = "\(indexPath.item)"
        return header
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        switchPage = true
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
    }
    

}


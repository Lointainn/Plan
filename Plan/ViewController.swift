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
    var data: Array<Month> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for index in 0...9 {
            let month:Month = Month()
            month.monthTitle = "2018.\(index+1)"
            data.append(month)
        }
        
        print(data)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MonthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthCell", for: indexPath) as! MonthCell
        cell.month = data[indexPath.item]
        return cell
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        switchPage = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffsetX = scrollView.contentOffset.x
        
        
        //向左滑
        if lastOffsetX < currentOffsetX {
//            print(currentOffsetX)
            
            
        } else if lastOffsetX > currentOffsetX {
//            print(currentOffsetX)
            
        }
        
        lastOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageNum = (Int)(scrollView.contentOffset.x / width_screen)
    }
    

}


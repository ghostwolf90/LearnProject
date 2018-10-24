//
//  CollectionCellExtension.swift
//  QLiEERPhoenix
//
//  Created by PocaChen on 2018/2/23.
//  Copyright © 2018年 QLIEER. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell{
    
    /**
     改變現在點擊的cell背景顏色，並恢復前一個點擊的cell顏色
     - Parameter newIndexPath: 當下點擊的cell indexPath
     - Parameter lastIndexPath: 前一個點擊的cell indexPath
     - Parameter resetColor: 想要恢復的顏色
     */
    func selectedCellColorChange(collectionView:UICollectionView, newIndexPath: IndexPath, lastIndexPath: inout IndexPath, resetColor : UIColor){
        collectionView.cellForItem(at: lastIndexPath)?.backgroundColor = resetColor
        lastIndexPath = newIndexPath
        collectionView.cellForItem(at: newIndexPath)?.backgroundColor = UIColor.selectedColor
    }
    
    func removeColor(collectionView:UICollectionView, indexPath: IndexPath, resetColor : UIColor){
        collectionView.cellForItem(at: indexPath)?.backgroundColor = resetColor
        collectionView.cellForItem(at: indexPath)?.layer.borderColor = UIColor.QlieerStyleGuide.qlrWormWhite.cgColor
    }
}

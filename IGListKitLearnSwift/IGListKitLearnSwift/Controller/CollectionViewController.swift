//
//  CollectionViewController.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/11/1.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit

class CollectionViewController: BasicViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: 属性
    let cellId = "CommonCollectionViewCell" // cell的ID
    let reusableViewId = "TextCollectionReusableView" // cell的ID
    let sectionsCount = 5 // 组数
    let itemsInSectionCount = 18 // 每组元素个数
    let cellHSpace: CGFloat = 15.0 // cell的水平间距
    let cellVSpace: CGFloat = 15.0 // cell的垂直间距
    let headerHeight: CGFloat = 33.0 // 组的头部高度
    let cellCountOfRow = 3 // 每行cell的个数
    let sectionEdge: CGFloat = 10.0 // 边距
    let screenWidth = UIScreen.main.bounds.size.width // 屏幕宽
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout();
        layout.minimumInteritemSpacing = cellHSpace
        layout.minimumLineSpacing = cellVSpace
        let W = (screenWidth - CGFloat((cellCountOfRow - 1))*cellHSpace - 2*sectionEdge)/CGFloat(cellCountOfRow)
        layout.itemSize = CGSize(width: W, height: W)
        layout.sectionInset = UIEdgeInsets(top: sectionEdge, left: sectionEdge, bottom: sectionEdge, right: sectionEdge)
        layout.headerReferenceSize = CGSize(width: screenWidth, height: headerHeight)
        
        let temp = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        temp.delegate = self
        temp.dataSource = self
        view.addSubview(temp)
        
        return temp
    } ()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(CommonCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(TextCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reusableViewId)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int { sectionsCount }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { itemsInSectionCount }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as? CommonCollectionViewCell else {
            fatalError()
        }
        
        cell.backgroundColor = UIColor.randomColor
        cell.hiddenLine = true
        cell.hiddenNextLabel = true
        cell.textLabel.textAlignment = NSTextAlignment.center
        cell.textLabel.numberOfLines = 0
        cell.textLabel.text = "(\(indexPath.section), \(indexPath.row))"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reusableViewId, for: indexPath) as? TextCollectionReusableView else {
            fatalError()
        }
        
        view.backgroundColor = .white
        view.textLabel.text = "第\(indexPath.section)组"
        
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

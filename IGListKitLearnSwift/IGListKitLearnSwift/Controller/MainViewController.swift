//
//  MainViewController.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/10/31.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit
import IGListKit


final class MainViewController: BasicListViewController {
    // MARK: 属性
    lazy var items: [BasicItem] = [
        BasicItem(title: "UICollectionView的使用", nextControllerClass: CollectionViewController.self),
        BasicItem(title: "尾部加载更多", nextControllerClass: LoadMoreViewController.self),
        BasicItem(title: "最后一行", line: false, arrow: false, selectedAction: { (index) in
            
        })
    ]
    
    // MARK: 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.collectionView = collectionView
    }
    
    // MARK: ListAdapterDataSource代理
    override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }
    override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return BasicSectionController()
    }
}

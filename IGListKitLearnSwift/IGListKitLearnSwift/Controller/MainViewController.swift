//
//  MainViewController.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/10/31.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit
import IGListKit


final class MainViewController: BasicListViewController, ListController {
    // MARK: 属性
    typealias Item = MainItem
    lazy var items: [MainItem] = [
        MainItem(title: "UICollectionView的使用", selectedAction: { (index) in
            let item = self.items[index]
            let collection = CollectionViewController()
            collection.title = item.title
            self.navigationController?.pushViewController(collection, animated: true)
        }),
        MainItem(title: "尾部加载更多", selectedAction: { (index) in
            let item = self.items[index]
            let collection = CollectionViewController()
            collection.title = item.title
            self.navigationController?.pushViewController(collection, animated: true)
        }),
        MainItem(title: "最后一行", line: false, arrow: false, selectedAction: { (index) in
            
        })
    ]
    
    // MARK: 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "IGListKit"
        adapter.collectionView = collectionView
    }
    
    // MARK: ListAdapterDataSource代理
    override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }
    override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return MainSectionController()
    }
}

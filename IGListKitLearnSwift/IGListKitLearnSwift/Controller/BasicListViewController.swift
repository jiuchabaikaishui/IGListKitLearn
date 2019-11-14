//
//  BasicListViewController.swift
//  IGListKitLearnSwift
//
//  Created by 苏铮 on 2019/11/1.
//  Copyright © 2019年 QSP. All rights reserved.
//

import UIKit
import IGListKit

protocol ListController {
    associatedtype Item
    var items: [Item] { get }
}

class BasicListViewController: BasicViewController, ListAdapterDataSource {
    // MARK: 属性
    lazy var adapter: ListAdapter = {
        let temp = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        temp.dataSource = self
        
        return temp
    }()
    lazy var collectionView: UICollectionView = {
        let temp = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.addSubview(temp)
        
        return temp
    }()
    
    // MARK: 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "IGListKit"
        adapter.collectionView = collectionView
    }
    
    // MARK: ListAdapterDataSource代理
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return [BasicItem]()
    }
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return BasicSectionController()
    }
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        let label = UILabel(frame: (listAdapter.collectionView?.bounds)!)
        label.textAlignment = NSTextAlignment.center
        label.text = "没有数据!"
        
        return label
    }
    
}

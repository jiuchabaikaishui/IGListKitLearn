//
//  ResultsViewController.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2020/1/3.
//  Copyright © 2020 QSP. All rights reserved.
//

import UIKit
import IGListKit

class ResultsViewController: BasicListViewController {
    var items = [ListDiffable]()
    var searchBarHeight: CGFloat = 0.0
    
    // MARK: 控制器生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.contentInset = UIEdgeInsets(top: view.safeAreaInsets.top + searchBarHeight, left: 0, bottom: view.safeAreaInsets.bottom, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: searchBarHeight, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    // MARK: ListAdapterDataSource代理
    override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }
    override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        return CommonSectionController()
    }
}

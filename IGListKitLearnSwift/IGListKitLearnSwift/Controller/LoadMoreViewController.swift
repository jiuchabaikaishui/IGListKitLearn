//
//  LoadMoreViewController.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2019/12/31.
//  Copyright © 2019 QSP. All rights reserved.
//

import UIKit
import IGListKit

class LoadMoreViewController: BasicListViewController, UIScrollViewDelegate {
    // MARK: 属性
    private var loading = false
    lazy var items: [ListDiffable] = {
        var temps = [BasicItem]()
        for index in 0...20 {
            temps.append(BasicItem(title: "\(index)"))
        }
        
        return temps
    }()
    
    // MARK: 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()

        self.adapter.scrollViewDelegate = self
    }
    
    override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (!self.loading) && scrollView.contentOffset.y + scrollView.bounds.height - scrollView.contentSize.height > 0 {
            self.loading = true;
            self.adapter.performUpdates(animated: true, completion: nil)
            DispatchQueue.global().async {
                Thread.sleep(forTimeInterval: 2.0)
                DispatchQueue.main.async {
                    for index in self.items.count..<(self.items.count + 20) {
                        self.items.append(BasicItem(title: "\(index)"))
                        self.loading = false
                        self.adapter.performUpdates(animated: true, completion: nil)
                    }
                }
            }
        }
    }
}

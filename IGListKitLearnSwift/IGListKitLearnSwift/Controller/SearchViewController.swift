//
//  SearchViewController.swift
//  IGListKitLearnSwift
//
//  Created by 綦 on 2020/1/2.
//  Copyright © 2020 QSP. All rights reserved.
//

import UIKit
import IGListKit

class SearchViewController: BasicListViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    lazy var items: [ListDiffable] = {
        let text = "Humblebrag skateboard tacos viral small batch blue bottle, schlitz fingerstache etsy squid. Listicle tote bag helvetica XOXO literally, meggings cardigan kickstarter roof party deep v selvage scenester venmo truffaut. You probably haven't heard of them fanny pack austin next level 3 wolf moon. Everyday carry offal brunch 8-bit, keytar banjo pinterest leggings hashtag wolf raw denim butcher. Single-origin coffee try-hard echo park neutra, cornhole banh mi meh austin readymade tacos taxidermy pug tattooed. Cold-pressed +1 ethical, four loko cardigan meh forage YOLO health goth sriracha kale chips. Mumblecore cardigan humblebrag, lo-fi typewriter truffaut leggings health goth."
        var results = [ListDiffable]()
        var unique = Set<String>()
        text.enumerateSubstrings(in: text.startIndex..<text.endIndex, options: .byWords) { (word, _, _, _) in
            if let value = word {
                if value.count > 0 && (!unique.contains(value)) {
                    results.append(CommonItem(title: value))
                }
            }
        }
        results.insert(SearchItem(placeholder: "搜索"), at: 0)
        
        return results
    } ()
    lazy var searchController: UISearchController = {
        let resultsController = ResultsViewController()
        let searchController = UISearchController(searchResultsController: resultsController)
        resultsController.searchBarHeight = searchController.searchBar.bounds.height
        searchController.delegate = self
        searchController.definesPresentationContext = true
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.sizeToFit()
        
        return searchController
    } ()
    lazy var searchSectionController: SearchSectionController = { SearchSectionController() } ()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: UISearchResultsUpdating代理方法
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    // MARK: UISearchControllerDelegate代理方法
    func didPresentSearchController(_ searchController: UISearchController) {
        searchController.searchBar.superview?.backgroundColor = .white
    }
    
    // MARK: UISearchBarDelegate代理方法
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let resultsController = searchController.searchResultsController as? ResultsViewController
        resultsController?.items = items.filter({ (item) -> Bool in
            let item = item as? CommonItem
            return item?.title?.contains(searchText) ?? false
        })
        resultsController?.adapter.performUpdates(animated: false, completion: nil)
    }
    
    // MARK: ListAdapterDataSource代理
    override func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return items
    }
    override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is SearchItem {
            searchSectionController.cellHeight = searchController.searchBar.bounds.height
            return searchSectionController
        }
        
        return CommonSectionController()
    }
}

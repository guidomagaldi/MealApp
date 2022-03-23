//
//  HomeUIView.swift
//  MealApp
//
//  Created by Guido Mola on 22/03/2022.
//

import UIKit

class SearchBarView: UIView {

    private var searchBar:UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search Here....."
        searchBar.sizeToFit()
        return searchBar
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(searchBar)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

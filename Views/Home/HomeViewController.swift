//
//  ViewController.swift
//  MealApp
//
//  Created by Guido Mola on 22/03/2022.
//

import UIKit

class HomeViewController : UIViewController {
    
    //let meals = []
    let vm = MealsViewModel()
    
    lazy var searchbar : UISearchController = {
        let s = UISearchController(searchResultsController: nil)
        s.hidesNavigationBarDuringPresentation = false
        s.searchResultsUpdater = self
        s.obscuresBackgroundDuringPresentation = false
        s.searchBar.placeholder = "Search Meals..."
        s.searchBar.searchBarStyle = .prominent
        return s
    }()
    
    lazy var homeFeedTable: UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 120, width: 200, height: 300))
        table.register(MealCell.self, forCellReuseIdentifier: "cell")
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.searchController = searchbar
        title = "Meal App"
        view.addSubview(homeFeedTable)
        updateView()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        homeFeedTable.frame = view.bounds
    }
    
    // Note: because this is NOT a subclassed UITableViewController,
    // DataSource and Delegate functions are NOT overridden
    
    // MARK: - Table view data source
    
    
    func updateView (){
        vm.searchMeals { data in
            print(data)
            self.homeFeedTable.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    
  
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //meals.count
        return vm.meals.count    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MealCell else { return UITableViewCell() }
        
        if vm.meals.count > indexPath.row{
            let meal = vm.meals[indexPath.row]
            
            cell.configureView(meal: meal)
        }
  
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // etc
    }
}

extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}


//
//  ViewController.swift
//  UISearchControllerIos
//
//  Created by Abdul Ahad on 7/31/17.
//  Copyright © 2017 plash. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate,UITableViewDataSource, UISearchResultsUpdating{

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet var tableView: UITableView!
    
    
    struct Cake {
        var name = String()
        var size = String()
    }
    
    var cakes = [Cake(name: "Red Velvet", size: "Small"),
                 Cake(name: "Brownie", size: "Medium"),
                 Cake(name: "Bannna Bread", size: "Large"),
                 Cake(name: "Vanilla", size: "Small"),
                 Cake(name: "Minty", size: "Medium")]
    
    var filteredCakes = [Cake]()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        filteredCakes = cakes
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
        //self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.reloadData()
    }

    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredCakes.count
    }
    
   // func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell 	{
     //   let cell = tableView(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
        
       // let cell: TableViewCell = TableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "cell")
    
    //cell.name?.text = self.filteredCakes[indexPath.row].name
      //  cell.size?.text = self.filteredCakes[indexPath.row].size
        
       // let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
       // cell.name.text = self.filteredCakes[indexPath.row].name
       // cell.size.text = self.filteredCakes[indexPath.row].size
        
       // return cell
    //}
    
    
    func tableView(_ cellForRowAttableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.name?.text =  self.filteredCakes[indexPath.row].name

        cell.size?.text = self.filteredCakes[indexPath.row].size
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row \(indexPath.row) selected")
    }
    
    
    //Call when text is typing in searchbar
    func updateSearchResults(for searchController: UISearchController) {
        // If we haven't typed anything into the search bar then do not filter the results
        if searchController.searchBar.text! == "" {
            filteredCakes = cakes
        } else {
            // Filter the results
            filteredCakes = cakes.filter { $0.name.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        
        self.tableView.reloadData()
    }

}


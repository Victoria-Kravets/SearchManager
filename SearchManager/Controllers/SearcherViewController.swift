//
//  ViewController.swift
//  SearchManager
//
//  Created by Admin on 07.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import UIKit

class SearcherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {

    // MARK: -
    // MARK: Properties
    
     @IBOutlet weak var tableView: UITableView?
     var searchBar: UISearchBar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureSearchBar()
        self.configureTableView()
        
    }


    // MARK: -
    // MARK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DataCell {
            cell.fill(name: "1")
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: -
    // MARK: SearchBar
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }

    // MARK: -
    // MARK: Private
    
    private func configureTableView() {
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        
        self.tableView?.frame = CGRect(x: 0, y: 71, width: 415, height: 550)
        self.tableView.do(self.view.addSubview(_:))
    }
    private func configureSearchBar() {
        self.searchBar = UISearchBar()
        self.searchBar?.delegate = self
        
        self.searchBar?.returnKeyType = UIReturnKeyType.done
        self.searchBar?.frame = CGRect(x: 0, y: 20, width: 415, height: 50)
        self.searchBar.do(self.view.addSubview(_:))
    }
}


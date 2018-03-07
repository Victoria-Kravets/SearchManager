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
        self.searchBar = UISearchBar()
        tableView?.delegate = self
        tableView?.dataSource = self
        
        searchBar?.delegate = self
        searchBar?.returnKeyType = UIReturnKeyType.done
        searchBar?.frame = CGRect(x: 0, y: 20, width: 415, height: 50)
        view.addSubview(searchBar!)
        tableView?.frame = CGRect(x: 0, y:71, width: 415, height: 550)
        view.addSubview(tableView!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            
        cell.textLabel?.text = "1"
            
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }

}


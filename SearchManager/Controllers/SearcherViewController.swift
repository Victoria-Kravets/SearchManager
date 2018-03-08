//
//  ViewController.swift
//  SearchManager
//
//  Created by Victoria Kravets on 07.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import UIKit

class SearcherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    // MARK: -
    // MARK: Properties
    
    @IBOutlet weak var tableView: UITableView?
    
    var textField: UITextField?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTextField()
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
    // MARK: TextField
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = self.textField?.text
        text.do(self.requestPost(text:))
        self.textField?.text = nil
        return true
    }
 
    // MARK: -
    // MARK: Private
    
    private func configureTableView() {
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
      
        self.tableView?.frame = CGRect(x: 20, y: 91, width: 415, height: 550)
        self.tableView.do(self.view.addSubview(_:))
    }
    
    private func configureTextField() {
        self.textField = UITextField(frame: CGRect(x: 30, y: 40, width: 355, height: 40))
        self.textField?.delegate = self

        self.textField?.placeholder = "Enter text here"
        self.textField?.borderStyle = UITextBorderStyle.roundedRect
        self.textField?.backgroundColor = UIColor.gray
        self.textField?.textColor = UIColor.white
        
        self.textField?.returnKeyType = UIReturnKeyType.done
        
        self.textField.do(self.view.addSubview(_:))
    }
    
    private func requestPost(text: String) {
        let api = ApiLayer(name: text)
        let post = api.requestPhoto { post in
            // write to Realm
            print(post)
        }
    }
}


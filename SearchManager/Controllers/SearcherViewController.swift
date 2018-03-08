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
    
    var historyLabel: UILabel?
    var textField: UITextField?
    
    var realmService = RealmService()
    var posts: [Post]?
    
    private var text: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.updateHistory()
    }

    // MARK: -
    // MARK: TableView
  
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return posts?.count ?? 0
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? DataCell {
            cell.post = posts?[indexPath.row]
 
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: -
    // MARK: TextField
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.text = self.textField?.text
        
        self.requestPost(text: text) {
            self.updateHistory()
            self.tableView?.reloadData()
        }
        
        self.textField?.text = nil
        
        return true
    }
 
    // MARK: -
    // MARK: Private
    
    private func updateHistory() {
        self.posts = self.realmService.getDataFromStorage()
        self.posts?.sort(by: { $0.id > $1.id })
    }
    
    private func configureUI() {
        self.configureTextField()
        self.configureTableView()
        self.confugureLabal()
    }
    
    private func confugureLabal() {
        
        let label = UILabel(frame: CGRect(x: 40, y: 91, width: 200, height: 21))
        label.text = "History"
        label.textColor = UIColor.gray
        self.view.addSubview(label)
    }
    
    private func configureTableView() {
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
      
        self.tableView?.frame = CGRect(x: 20, y: 122, width: 415, height: 550)
        self.tableView.do(self.view.addSubview(_:))
    }
    
    private func configureTextField() {
        self.textField = UITextField(frame: CGRect(x: 30, y: 40, width: 355, height: 40))
        self.textField?.delegate = self

        self.textField?.placeholder = "Enter text here"
        self.textField?.borderStyle = UITextBorderStyle.roundedRect
        self.textField?.backgroundColor = UIColor.lightGray
        self.textField?.textColor = UIColor.white
        
        self.textField?.returnKeyType = UIReturnKeyType.done
        
        self.textField.do(self.view.addSubview(_:))
    }
    
    private func requestPost(text: String?, completion: @escaping () -> ()) {
        let api = text.apply { ApiLayer(name: $0) }
        let post = api?.requestPhoto { post in
            
            if post == nil {
                self.text.do(self.showAlertMessage(name:))
            }
            
            post.do { self.realmService.writeDataInStorage(object: $0) }
            completion()
        }
    }
    
    private func showAlertMessage(name: String) {
        
        let alert = UIAlertController(title: "Sorry!", message: "We couldn't find any image by name: \(name)", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}


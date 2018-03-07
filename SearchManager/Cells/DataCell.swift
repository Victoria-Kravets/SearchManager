//
//  DataCell.swift
//  SearchManager
//
//  Created by Victoria Kravets on 07.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import UIKit

public class DataCell: UITableViewCell {

    // MARK: -
    // MARK: Properties
    
    public var nameLabel: UILabel?
    public var photoImage: UIImageView?
    
    // MARK: -
    // MARK: Public
    
    public func fill(name: String) {
        self.configureCell()
        self.nameLabel?.text = name
    }
    
    // MARK: -
    // MARK: Private
    
    private func configureCell() {
        self.configureLabel()
        self.configureImage()
    }
    
    private func configureLabel() {
        self.nameLabel = UILabel(frame: CGRect(x: 10, y: 10, width: 40, height: 15))
        self.nameLabel.do(self.addSubview(_:))
     
    }
    
    private func configureImage() {
        self.photoImage = UIImage()
    }
}

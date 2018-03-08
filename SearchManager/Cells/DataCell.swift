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
    
    public var photoImage: UIImageView?
    
    @IBOutlet weak var nameLabel: UILabel?
    
    public var post: Post? {
        didSet {
            self.fill(with: post)
        }
    }
    
    // MARK: -
    // MARK: Public
    
    public func fill(with post: Post?) {
        self.configureCell()
        self.nameLabel?.text = post?.name
    }
    
    // MARK: -
    // MARK: Private
    
    private func configureCell() {
        self.configureLabel()
        self.configureImage()
    }
    
    private func configureLabel() {
        self.nameLabel?.frame = CGRect(x: 120, y: 20, width: 240, height: 15)
    }
    
    private func configureImage() {
        var imageLoadService = ImageDownloadService(networkService: NetworkService(session: URLSession(configuration: .default)))
            
        photoImage = UIImageView(frame: CGRect(x: 30, y: 10, width: 50, height: 50))
        self.photoImage.do(self.addSubview(_:))
        
        let imageModel = self.post?.imageUrl.flatMap(URL.init(string:)).map { ImageModel.init(url: $0, imageLoadService: imageLoadService) }
        
        imageModel.do(self.fillPhoto(with:))
    }
    
    private func fillPhoto(with model: ImageModel) {
        model.load { image in
            DispatchQueue.main.async {
                self.photoImage?.image = image
            }
        }
    }
}

//
//  ImageModel.swift
//  SearchManager
//
//  Created by Victoria Kravets on 07.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

import UIKit

public class ImageModel {
    
    // MARK: -
    // MARK: Properties
    
    public let url: URL
    public private(set) weak var image: UIImage?

    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(url: URL) {
        self.url = url
    }
    
    // MARK: -
    // MARK: Public
    
    public func load(completion: @escaping (UIImage?) -> ()) {
        
    }
}

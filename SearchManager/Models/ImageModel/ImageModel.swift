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
    public let imageLoadService: ImageDownloadService
    
    
    private let lock = NSRecursiveLock()
    private var cancellable: Cancellable = LoadedImageModelTask()
    public var isLoaded: Bool {
        return self.image != nil
    }

    // MARK: -
    // MARK: Init and Deinit
    
    public init(url: URL, imageLoadService: ImageDownloadService) {
        self.url = url
        self.imageLoadService = imageLoadService
    }
    
    // MARK: -
    // MARK: Public
    
    public func load(completion: @escaping (UIImage?) -> ()) -> Cancellable {
        return self.lock.do {
            
            if isLoaded {
                completion(self.image)
                
                return LoadedImageModelTask()
            } else {
                let cancellable = self.imageLoadService.fetchImage(url: self.url) { image in
                    image.do(completion)
                }
                
                self.cancellable = cancellable
                return self.cancellable
            }
        }
    }
}

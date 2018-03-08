//
//  ImageDownloadService.swift
//  SearchManager
//
//  Created by Victoria Kravets on 08.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation
import UIKit

public class ImageDownloadService {
    
    // MARK: -
    // MARK: Properties
    
    public let networkService: NetworkService
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    // MARK: -
    // MARK: Public
    
    public func fetchImage(url: URL, completion: @escaping (UIImage?) -> ()) -> Cancellable {
        return self.networkService.data(at: url) { result in
            completion(result.map(UIImage.init).value.flatten())
        }
    }
}

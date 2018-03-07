//
//  GettyImagesAPI.swift
//  SearchManager
//
//  Created by Victoria Kravets on 07.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public class ApiLayer {
    
    // MARK: -
    // MARK: Properties
    
    private var urlComponents = URLComponents(string: "https://api.gettyimages.com/v3/search/images")
    public var name: String
    
    // MARK: -
    // MARK: Properties
    
    public init(name: String) {
        self.name = name
    }
    
    // MARK: -
    // MARK: Public
    
    public func createURLWithComponents() -> URL? {
        let param = NSURLQueryItem(name: "phrase", value: self.name)
        self.urlComponents?.queryItems = [param as URLQueryItem]
        
        return self.urlComponents?.url
    }

}

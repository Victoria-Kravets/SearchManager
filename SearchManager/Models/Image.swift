//
//  Image.swift
//  SearchManager
//
//  Created by Victoria Kravets on 08.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

import Foundation
import RealmSwift
import ObjectMapper

class Image: Object, Mappable {
    
    // MARK: -
    // MARK: Properties
    
    @objc dynamic var url: String?
    
    convenience init(url: String) {
        self.init()
        self.url = url
    }
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        url    <- map["uri"]
    }
    
}

//
//  Post.swift
//  
//
//  Created by Victoria Kravets on 08.03.2018.
//

import Foundation
import RealmSwift
import ObjectMapper

public class Post: Object, Mappable {
    
    // MARK: -
    // MARK: Properties
    
    @objc dynamic var name: String?
    @objc dynamic var imageUrl: Image?
    
    // MARK: -
    // MARK: Init and Deinit
    
    convenience init(name: String, imageUrl: Image) {
        self.init()
        self.name = name
        self.imageUrl = imageUrl
    }
    
    required convenience public init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        imageUrl    <- map["display_sizes"]
    }
    
}

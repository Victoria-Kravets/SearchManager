//
//  Post.swift
//  
//
//  Created by Victoria Kravets on 08.03.2018.
//

import Foundation
import RealmSwift
import ObjectMapper

public class Post: Object {
    
    // MARK: -
    // MARK: Properties
    
    @objc dynamic var name: String?
    @objc dynamic var imageUrl: String?
    @objc dynamic var id: String = ""
    
    // MARK: -
    // MARK: Init and Deinit
    
    convenience init(name: String, imageUrl: String) {
        self.init()
        let idProvider: ID = autoincrementedID(key: "post")()
        
        self.id = idProvider.description
        self.name = name
        self.imageUrl = imageUrl
    }
}

public func ==(lhs: Post, rhs: Post) -> Bool {

    return Int(lhs.id) == Int(rhs.id)
}


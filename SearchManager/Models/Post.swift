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
    
    // MARK: -
    // MARK: Init and Deinit
    
    convenience init(name: String, imageUrl: String) {
        self.init()
        self.name = name
        self.imageUrl = imageUrl
    }    
}

//
//  RealmService.swift
//  SearchManager
//
//  Created by Victoria Kravets on 08.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmService {
    
    //MARK: -
    //MARK: Public
    
    public func writeDataInStorage(object: Post) {
        
        Realm.write { $0.add(object) }
    }
    
    public func getDataFromStorage() -> Results<Post>? {
        
        return Realm.current?.objects(Post.self)
    }
}

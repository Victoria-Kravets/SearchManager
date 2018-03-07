//
//  GettyImagesAPI.swift
//  SearchManager
//
//  Created by Victoria Kravets on 07.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation
import ObjectMapper

public class ApiLayer {
    
    // MARK: -
    // MARK: Properties
    
    private var urlComponents = URLComponents(string: "https://api.gettyimages.com/v3/search/images")
    public var name: String
    public private(set) var bestPost: Post?
    
    // MARK: -
    // MARK: Properties
    
    public init(name: String) {
        self.name = name
    }
    
    // MARK: -
    // MARK: Public
    
    public func requestPhoto(_ completion: @escaping (Post?) -> ()) {
        let url = self.createURLWithComponents()
        let request = NSMutableURLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("27waaxucyynqc6yrdp9tup27", forHTTPHeaderField: "Api-Key")
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest) {data,response,error in
            print(data)
            if let responseData = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments)
                    self.bestPost = self.parsingData(data: json)
                    completion(self.bestPost)
                    print(self.bestPost)
                } catch {
                    print("Could not serialize")
                }
            }
        }
        
        dataTask.resume()
    }
    
    // MARK: -
    // MARK: Private
    
    private func createURLWithComponents() -> URL? {
        let param = NSURLQueryItem(name: "phrase", value: self.name)
        self.urlComponents?.queryItems = [param as URLQueryItem]
        
        return self.urlComponents?.url
    }
    
    private func parsingData(data: Any?) -> Post? {
        let posts:[String: Any]? =  data.flatMap(cast)
        var bestPost: Post?
        
        posts.do{
            let resultPosts = Mapper<Post>().map(JSON:$0)
            print(resultPosts)
            let url = resultPosts?.imageUrl?.url
            let image = url.apply { url in Image(url: url) }
            self.bestPost = image.apply { image in Post(name: self.name, imageUrl: image) }
        }
        
        return bestPost
    }
}

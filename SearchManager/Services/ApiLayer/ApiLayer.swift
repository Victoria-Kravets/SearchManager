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
  
            if let responseData = data {
                do{
                    let json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments)
                    self.parsingData(data: json) { post in
                        DispatchQueue.main.async {
                            completion(post)
                        }
                    }
                    
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
    
    private func parsingData(data: Any?, completion: (Post?) -> ()) {
        let data: [String: Any]? =  data.flatMap(cast)
        let posts: [[String: Any]]? = (data?["images"]).flatMap(cast)
        if posts?.count == 0 {
            completion(nil)
            return
        }
        
        let post  = posts?[0]

        let image: [[String: Any]]? = (post?["display_sizes"]).flatMap(cast)
        let url: String? = (image?.first?["uri"]).flatMap(cast)
        let bestPost = url.flatMap { Post.init(name: self.name, imageUrl: $0) }
        
        completion(bestPost)
    }
}

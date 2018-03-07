//
//  NetworkService.swift
//  SearchManager
//
//  Created by Victoria Kravets on 08.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public enum NetworkServiceError: Error {
    case unknown
    case failed
}

public class NetworkService {
    
    // MARK: -
    // MARK: Properties
    
    let session: URLSession
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(session: URLSession) {
        self.session = session
    }
    
    // MARK: -
    // MARK: Public
    
    public func data(at url: URL, completion: @escaping (Result<Data, NetworkServiceError>) -> ()) -> NetworkTask {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("27waaxucyynqc6yrdp9tup27", forHTTPHeaderField: "Api-Key")
        
        let dataTask = self.session.dataTask(with: urlRequest) { data, response, error in
            print(data)
            DispatchQueue.global(qos: .background).async {
                completion § Result(
                    value: data,
                    error: error.map(ignoreInput § returnValue § .failed),
                    default: .unknown
                )
            }
        }
        
        dataTask.resume()
        
        return NetworkTask(session: dataTask)
    }
}

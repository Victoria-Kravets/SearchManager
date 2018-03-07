//
//  NetworkTask.swift
//  SearchManager
//
//  Created by Victoria Kravets on 08.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public class NetworkTask: Cancellable {
    
    // MARK: -
    // MARK: Properties
    
    let urlSessionTask: URLSessionTask
    public var isCancelled: Bool = false
    
    // MARK: -
    // MARK: Init and Deinit
    
    public init(session: URLSessionTask) {
        self.urlSessionTask = session
    }
    
    // MARK: -
    // MARK: Public
    
    public func cancel() {
        self.urlSessionTask.cancel()
        self.isCancelled = true
    }   
}

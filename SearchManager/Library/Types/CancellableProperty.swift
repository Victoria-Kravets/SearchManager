//
//  CancellableProperty.swift
//  SearchManager
//
//  Created by Victoria Kravets on 07.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

public protocol Cancellable {
    
    var isCancelled: Bool { get }
    
    func  cancel()
}

public class CancellableProperty {
    
    // MARK: -
    // MARK: Properties
    
    public var value: Cancellable? {
        willSet { value?.cancel() }
    }
}

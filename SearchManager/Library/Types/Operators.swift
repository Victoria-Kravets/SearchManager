//
//  Operators.swift
//  SearchManager
//
//  Created by Victoria Kravets on 08.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

infix operator •: CompositionPrecedence
func • <A, B, C>(f: @escaping (A) -> B, g: @escaping (B) -> C) -> (A) -> C {
    return { g(f($0)) }
}

infix operator §: RightFunctionApplicationPrecedence
public func § <A, B>(f: (A) -> B, value: A) -> B {
    return f(value)
}

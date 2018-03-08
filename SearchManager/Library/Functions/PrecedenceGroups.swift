//
//  PrecedenceGroups.swift
//  SearchManager
//
//  Created by Victoria Kravets on 08.03.2018.
//  Copyright © 2018 Victoria Kravets. All rights reserved.
//

import Foundation

precedencegroup LeftFunctionApplicationPrecedence {
    associativity: left
    higherThan: AssignmentPrecedence
}

precedencegroup RightFunctionApplicationPrecedence {
    associativity: right
    higherThan: LeftFunctionApplicationPrecedence
}

precedencegroup CompositionPrecedence {
    associativity: left
    higherThan: RightFunctionApplicationPrecedence
}

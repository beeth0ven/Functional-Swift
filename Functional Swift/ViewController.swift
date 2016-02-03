//
//  ViewController.swift
//  Functional Swift
//
//  Created by luojie on 16/2/3.
//  Copyright © 2016年 LuoJie. All rights reserved.
//

import UIKit

typealias Predicate = Int -> Bool

class ViewController: UIViewController {

    func lessThan(maxInt: Int) -> Predicate {
        return { int in int < maxInt }
    }
    
    func greaterThan(minInt: Int) -> Predicate {
        return { int in minInt < int }
    }
    
    func and(predicate1 predicate1: Predicate, predicate2: Predicate) -> Predicate {
        return { int in predicate1(int) && predicate2(int) }
    }
    
    // Not Functional Programing
    func isBetween(int: Int, minInt: Int, maxInt: Int) -> Bool {
        let lessThanResult      = int < maxInt
        let greaterThanResult   = minInt < int
        return lessThanResult && greaterThanResult
    }

    // Functional Programing
    func isBetween1(int: Int, minInt: Int, maxInt: Int) -> Bool {
        let lessThanPredicate       = lessThan(maxInt)
        let greaterThanPredicate    = greaterThan(minInt)
        let andPredicate            = and(predicate1:lessThanPredicate, predicate2: greaterThanPredicate)
        return andPredicate(int)
    }

    // Functional Programing is Equal to this
    func isBetween2(int: Int, minInt: Int, maxInt: Int) -> Bool {
        return and(predicate1:lessThan(maxInt), predicate2: greaterThan(minInt))(int)
    }
    
    // Functional Programing is Equal to this too
    func isBetween3(int: Int, minInt: Int, maxInt: Int) -> Bool {
        return { int in
            { int in int < maxInt }(int) && { int in minInt < int }(int)
        }(int)
        
    }
    
}


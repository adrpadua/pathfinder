//
//  Class.swift
//  pathfinder
//
//  Created by Adrian Padua on 1/21/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import Foundation

class Class {
    
    var _name: String!
    var _desc: String!
    var _set: String!
    
    var name: String {
        return _name
    }
    
    var desc: String {
        return _desc
    }
    
    var set: String {
        return _set
    }
    
    init(name: String, desc: String, set: String) {
        self._name = name
        self._desc = desc
        self._set = set
    }
    
    
}
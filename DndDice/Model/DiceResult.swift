//
//  DiceResult.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 3.01.2021.
//

import Foundation

struct DiceResult{
   
    private var _result : Int
    private var _results : [Int]
    
    init(_result : Int , _results : [Int]) {
        self._result = _result
        self._results = _results
    }
    
    var result : Int{
        get{
            return _result
        }
    }
    
    var results : [Int]{
        get{
            return _results
        }
    }
    
    
}

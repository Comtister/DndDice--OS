//
//  DndDice.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 3.01.2021.
//

import Foundation

class DndDice: DiceRoll {
    
    private var _diceId : Int
    private var _diceCount : Int
    private var _diceType : DiceType
    private var _diceBonus : Int
    
    init(diceId : Int , diceCount : Int , diceType : DiceType , diceBonus : Int) {
        self._diceId = diceId
        self._diceCount = diceCount
        self._diceType = diceType
        self._diceBonus = diceBonus
    }
    
    
    func roll() -> Int {
        return 0
    }
    
    
    var diceId : Int{
        get{
            return _diceId
        }set{
            _diceId = newValue
        }
    }
    
    var diceCount : Int{
        get{
            return _diceCount
        }set{
            _diceCount = newValue
        }
    }
    
    var diceType : DiceType{
        get{
            return _diceType
        }set{
            _diceType = newValue
        }
    }
    
    var diceBonus : Int{
        get{
            return _diceBonus
        }set{
            _diceBonus = newValue
        }
    }
    
    
    
    
}

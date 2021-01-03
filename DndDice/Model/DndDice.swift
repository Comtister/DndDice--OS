//
//  DndDice.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 3.01.2021.
//

import Foundation

class DndDice {
    
    
    private var _diceCount : Int
    private var _diceType : DiceType
    private var _diceBonus : Int?
    
    init(diceCount : Int , diceType : DiceType , diceBonus : Int?) {
       
        self._diceCount = diceCount
        self._diceType = diceType
        self._diceBonus = diceBonus == 0 ? nil : diceBonus
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
    
    var diceBonus : Int?{
        get{
            return _diceBonus
        }set{
            _diceBonus = newValue == 0 ? nil : newValue
            
        }
    }
    
    
    
    
}

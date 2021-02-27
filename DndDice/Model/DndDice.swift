//
//  DndDice.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 3.01.2021.
//

import Foundation

class DndDice : DiceRoll {
    
    
    private var _diceCount : Int
    private var _diceType : DiceType
    private var _diceBonus : Int
    
    init(diceCount : Int , diceType : DiceType , diceBonus : Int) {
       
        self._diceCount = diceCount
        self._diceType = diceType
        self._diceBonus = diceBonus
    }
    
    func roll() -> DiceResult? {
        
        var tekdegerler : [Int] = []
        
        var zar : Int = Int.random(in: 1...self.diceType.rawValue)
       
        
        tekdegerler.append(zar)
        
        if self._diceCount > 1{
            for _ in 0..<self._diceCount-1{
                
                let extraZar : Int = Int.random(in: 1...self.diceType.rawValue)
               
                
                tekdegerler.append(extraZar)
                zar += extraZar
                
            }
        }
        
        zar += self._diceBonus
        
        if zar <= 0{
            return nil
        }
        
        let result : DiceResult = DiceResult(_result: zar, _results: tekdegerler)
        
        return result
        
        
        
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

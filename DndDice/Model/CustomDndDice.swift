//
//  CustomDndDice.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 3.01.2021.
//

import Foundation

class CustomDndDice : DiceRoll  {
   

    private var _diceId : Int
    private var _diceName : String
    private var _dices : [DndDice]
    
   init(diceId : Int , diceName : String , dices : [DndDice]) {
        self._diceId = diceId
        self._diceName = diceName
        self._dices = dices
    }
    
    
    func roll() -> DiceResult? {
        
        var tekdegerler : [Int] = []
        var totalZar : Int = 0
        
        for currentDice in dices{
            
            var zar : Int = Int.random(in: 1...currentDice.diceType.rawValue)
           
            tekdegerler.append(zar)
            
            if currentDice.diceCount > 1{
                for _ in 0..<currentDice.diceCount-1{
                    
                    let extraZar : Int = Int.random(in: 1...currentDice.diceType.rawValue)
                   
                    
                    tekdegerler.append(extraZar)
                    zar += extraZar
                    
                }
            }
            
        
            zar += currentDice.diceBonus ?? 0
            
            if zar <= 0{
                return nil
            }
            
            totalZar += zar

        }
        
        return  DiceResult(_result: totalZar, _results: tekdegerler)
    
    }
    
    
    var diceId : Int{
        get{
            return _diceId
        }
    }
    
    var diceName : String{
        get{
            return _diceName
        }
    }
    
    var dices : [DndDice]{
        get{
            return _dices
        }
    }
    
    
    
}

//
//  DiceRoller.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 26.12.2020.
//

import Foundation

public class DiceRoller{
    
    
    private static let zarId_Value : [Int : Int] = [0:4,1:6,2:8,3:10,4:12,5:20,6:100]
    private static var tekdegerler : [String] = []
    
    static func diceRoll(diceId : Int,extras : (kat : Int,bonus : Int)) -> (Int,[String])? {
        //Array Cleaning
        tekdegerler.removeAll()
        
        var zar : Int = Int.random(in: 1...zarId_Value[diceId]!)
        let ilkDegerStr : String = String(zar)
        
        tekdegerler.append(ilkDegerStr)
        
        if extras.kat > 1{
            for _ in 0..<extras.kat-1{
                
                let extraZar : Int = Int.random(in: 1...zarId_Value[diceId]!)
                let extraZarStr : String = String(extraZar)
                
                tekdegerler.append(extraZarStr)
                zar += extraZar
                
            }
        }
        
        zar += extras.bonus
        
        if zar <= 0{
            return nil
        }
        
        return (zar,tekdegerler)
        
    }
    
    
    
}

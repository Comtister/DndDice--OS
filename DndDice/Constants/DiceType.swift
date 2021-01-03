//
//  DiceType.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 3.01.2021.
//

import Foundation

enum DiceType : LosslessStringConvertible {
    
    case d4
    case d6
    case d8
    case d10
    case d12
    case d20
    case d100
    
    init?(_ description: String) {
       
        switch description {
        case "d4": self = DiceType.d4
        case "d6": self = DiceType.d6
        case "d8": self = DiceType.d8
        case "d10": self = DiceType.d10
        case "d12": self = DiceType.d12
        case "d20": self = DiceType.d20
        case "d100": self = DiceType.d100
        default:
            return nil
        }
        
        
        
    }
    
    var description: String{
        get{
            switch self {
            case .d4: return "d4"
            case .d6: return "d6"
            case .d8: return "d8"
            case .d10: return "d10"
            case .d12: return "d12"
            case .d20: return "d20"
            case .d100: return "d100"
            default:
                return ""
            }
        }
    }
    
  
}

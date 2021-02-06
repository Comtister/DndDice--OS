//
//  DiceSaveViewDelegate.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 14.01.2021.
//

import Foundation

protocol DiceSaveViewDelegate {
    
    func diceTypeBackwark(sender : DiceSaveView)
    func diceTypeForwadwark(sender : DiceSaveView)
    
    func diceCountBackwark(sender : DiceSaveView)
    func diceCountForwadwark(sender : DiceSaveView)
    
    func diceBonusBackwark(sender : DiceSaveView)
    func diceBonusForwadwark(sender : DiceSaveView)
    
    func diceAdd(sender : DiceSaveView)
    func diceDelete(sender : DiceSaveView)
    
    
}

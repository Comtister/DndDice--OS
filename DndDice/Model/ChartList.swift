//
//  ChartList.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 24.01.2021.
//

import Foundation

struct ChartList {
    
    var chartArray : [(DiceSaveView , DndDice , DiceInstances)]!
    
    var count : Int{
        get{
            return chartArray.count
        }
    }
    
    init() {
        chartArray = [(DiceSaveView , DndDice , DiceInstances)]()
    }
    
    mutating func addChart(chart : DiceSaveView , dice : DndDice , instances : DiceInstances) -> Void{
        self.chartArray.append((chart , dice , instances))
       
        
    }
    
    mutating func changeDiceValue(chart : DiceSaveView ,diceData : (DndDice , DiceInstances)) -> Void{
        
        var index : Int = 0
        
        for x in self.chartArray{
            
            if x.0 === chart{
                
                chartArray[index] = (chart , diceData.0 , diceData.1)
                
            }
            index += 1
        }
        
        
    }
    
    mutating func getDice(chart : DiceSaveView) -> (DndDice , DiceInstances){
        
        var dice : (DndDice , DiceInstances)!
        
        for x in self.chartArray{
            
            if x.0 === chart{
                dice = (x.1,x.2)
            }
            
        }
      
        return dice
        
    }
    
    mutating func getIndex(chart : DiceSaveView) -> Int?{
        
        var index : Int = 0
        
        for x in self.chartArray{
            
            if x.0 === chart{
                
                return index
                
            }
            index += 1
        }
        
        return nil
        
    }
    
    mutating func removeChart(chart : DiceSaveView) -> Int?{
        
        var index : Int = 0
        
        for x in self.chartArray{
            
            if x.0 === chart{
                self.chartArray.remove(at: index)
                return index
            }else{
                index += 1
            }
            
        }
        
        return nil
       
    
    }
    
    mutating func getChart(at index : Int) -> DiceSaveView?{
        
        if index <= self.chartArray.count - 1{
            return self.chartArray[index].0
        }
        return nil
       
    }
    
    
}

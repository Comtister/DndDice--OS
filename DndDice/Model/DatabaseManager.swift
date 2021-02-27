//
//  DatabaseManager.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 19.02.2021.
//

import Foundation
import FMDB

class DatabaseManager {
    
    private static var dbManager : DatabaseManager? = nil
    
    private static let createDICE_TABLE_SQL = "CREATE TABLE IF NOT EXISTS DICE(id char PRIMARY KEY , name char)"
    private static let createDICES_TABLE_SQL = "CREATE TABLE IF NOT EXISTS DICES(id char , kat INTEGER , tip char , bonus INTEGER , FOREIGN KEY(id) REFERENCES DICE(id))"
    
    private init(){
        
        
    }
    
    private func createOrOpenDatabase() -> FMDatabase{
        
        let dbUrl = try! FileManager.default.url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let dbPath = dbUrl.appendingPathComponent("dice.db").path
        return FMDatabase(path: dbPath)
        
    }
    
   
    static func createOrOpenDatabase() -> DatabaseManager{
        
        if self.dbManager == nil{
            do{
                self.dbManager = DatabaseManager()
                let db = self.dbManager!.createOrOpenDatabase()
                print(db.databasePath)
                
                db.open()
                
                try! db.executeUpdate(createDICE_TABLE_SQL, values: nil)
                try! db.executeUpdate(createDICES_TABLE_SQL, values: nil)
                
                db.close()
                
                return self.dbManager!
                
            }catch{
                
            }
        }
        
        return self.dbManager!
        
    }
    
    func insertData(customDice : CustomDndDice){
        
        do{
            let db = createOrOpenDatabase()
            db.open()
            
            try! db.executeUpdate("INSERT INTO DICE VALUES (?,?)", values: [customDice.diceId,customDice.diceName])
            
            for dice in customDice.dices{
                
                try! db.executeUpdate("INSERT INTO DICES VALUES(?,?,?,?)", values: [customDice.diceId,dice.diceCount,dice.diceType.description,dice.diceBonus])
                
            }
            db.close()
        }catch{
            print("Veri Girişi Sıçtı")
        }
        
        
    }
    
    func fetchData() -> [CustomDndDice]{
       
        var diceDatas : [CustomDndDice] = [CustomDndDice]()
        var dices : [DndDice] = [DndDice]()
        
        do{
            
            let db = createOrOpenDatabase()
            db.open()
            
            let diceQuery = try! db.executeQuery("SELECT * FROM DICE", values: nil)
            
            while diceQuery.next() {
                let id = diceQuery.string(forColumn: "id")!
                let name = diceQuery.string(forColumn: "name")!
                
                let valuesQuery = try! db.executeQuery("SELECT kat,tip,bonus FROM DICES WHERE id = (?)", values: [id])
                
                while valuesQuery.next() {
                    let kat = Int(valuesQuery.int(forColumn: "kat"))
                    let tip = valuesQuery.string(forColumn: "tip")!
                    let bonus = Int(valuesQuery.int(forColumn: "bonus"))
                    
                    let dice = DndDice(diceCount: kat, diceType: DiceType.init(tip)!, diceBonus: bonus)
                    dices.append(dice)
                    
                }
                let customDice = CustomDndDice(diceId: id, diceName: name, dices: dices)
                diceDatas.append(customDice)
                
                dices.removeAll()
                
            }
            db.close()
        }catch{
            
        }
        
        return diceDatas
        
    }
    
    func deleteData(id : String){
        
        
        do{
            
            
            let db = createOrOpenDatabase()
            db.open()
            
             try db.executeUpdate("DELETE FROM DICES WHERE id = (?)", values: [id])
             try db.executeUpdate("DELETE FROM DICE WHERE id = (?)", values: [id])
            
            db.close()
            
        }catch{
            
            print("suçtı")
            
        }
        
        
    }
    

}

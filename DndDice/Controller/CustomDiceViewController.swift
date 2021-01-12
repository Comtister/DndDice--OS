//
//  CustomDiceViewController.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 11.11.2020.
//

import UIKit

class CustomDiceViewController: UIViewController,UITabBarDelegate,UITableViewDataSource, UITableViewDelegate {
    
    var addButon : UIButton!
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var tapGesture : UITapGestureRecognizer!
    
    var data : [CustomDndDice] = [CustomDndDice]()
    
    var popView : DicePop!
    var isPopOpen : Bool = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        popView = DicePop(frame: CGRect(x: 0, y: 0, width: self.view.frame.height/3, height: self.view.frame.height/3))
        
        popView.center.x = view.center.x
        popView.center.y = view.center.y - popView.frame.height / 2
        
        tapGesture.cancelsTouchesInView = false
        
        let dice = DndDice(diceCount: 1, diceType: .d6, diceBonus: 4)
        let dice2 = DndDice(diceCount: 1, diceType: .d6, diceBonus: 0)
        var dices : [DndDice] = [DndDice]()
        dices.append(dice)
        dices.append(dice2)
        
        let cDice = CustomDndDice(diceId: 0, diceName: "FireBolt", dices:dices )
        
        data.append(cDice)
        
        
        
        addButon = UIButton()
        setTableButton(object: addButon, x: 20, y: 20, width: 100, height: 50)
        addButon.addTarget(self, action: #selector(saveScreen(_:)), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
      
        
       
    }
    
    @IBAction func tap(_ sender : UITapGestureRecognizer){
      
        if isPopOpen{
           
            popView.removeFromSuperview()
            isPopOpen = false
            for view in self.view.subviews{
                view.isUserInteractionEnabled = true
            }

        }
    
    }
    
    
    @objc func saveScreen(_ sender : UIButton){
        sender.blinkAnim(sender: sender)
        performSegue(withIdentifier: "goDiceSave", sender: nil)
       
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomDiceCell{
            
            cell.setTexts(Dice: data[indexPath.row])
            
            return cell
            
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        isPopOpen = true
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        for view in self.view.subviews{
            view.isUserInteractionEnabled = false
        }
        
        if let result : DiceResult = data[indexPath.row].roll(){
            
            popView.setData(Title: data[indexPath.row].diceName, data: result)
            
            
        }
        
        self.view.addSubview(popView)
        
       
        
    
    }
    
    
  

}

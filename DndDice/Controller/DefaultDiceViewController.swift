//
//  DefaultDiceViewController.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 11.11.2020.
//

import UIKit

class DefaultDiceViewController: UIViewController {
    
    @IBOutlet var bottomStackView : UIStackView!
    
    @IBOutlet var diceStack : [DiceView]!
    let diceStackNames : [String] = ["d4","d6","d8","d10","d12","d20","d100"]
    let diceTypes : [DiceType] = [.d4,.d6,.d8,.d10,.d12,.d20,.d100]
    
    @IBOutlet var katArttirBtn : UIButton!
    @IBOutlet var katAzaltBtn : UIButton!
    @IBOutlet var bonusArttirBtn : UIButton!
    @IBOutlet var bonusAzaltBtn : UIButton!
    
    @IBOutlet var katLbl : UILabel!
    @IBOutlet var bonusLbl : UILabel!
    
    var diceKat : Int = 1
    var diceBonus : Int = 0
    
    var diceShow : Bool = false
    
    var popView : DicePop!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        popView = DicePop(frame: CGRect(x: 0, y: 0, width: self.view.frame.height/3, height: self.view.frame.height/3))
        
        popView.center.x = view.center.x
        popView.center.y = view.center.y - popView.frame.height / 2
        
        
        setZarStack()
        setButonViews()
        //Setting bottom stack
        bottomStackView.isLayoutMarginsRelativeArrangement = true
        bottomStackView.layoutMargins = UIEdgeInsets(top: 0, left:10, bottom: 0, right: 10)
        
    
    }
    
    //MARK:- Setting Zar Views
    private func setZarStack(){
        var index : Int8 = 0
        for zar in diceStack{
            zar.image.image = UIImage(named: diceStackNames[Int(index)])
            zar.diceId = diceTypes[Int(index)]
            zar.addTarget(self, action: #selector(DiceRollAction(_:)), for: .touchUpInside)
            index += 1
        }
      
    }
    //MARK:- Setting Buton Views
    private func setButonViews(){
        
        katLbl.text = String("\(diceKat)D")
        bonusLbl.text = String("+\(diceBonus)")
        
        katArttirBtn.layer.cornerRadius = 5
        katAzaltBtn.layer.cornerRadius = 5
        bonusArttirBtn.layer.cornerRadius = 5
        bonusAzaltBtn.layer.cornerRadius = 5
        
       
    }
    
    
    
    @IBAction func katArttir(_ sender : UIButton) {
            sender.blinkAnim(sender: sender)
            diceKat += 1
            katLbl.text = String("\(self.diceKat)D")
    }
    @IBAction func katAzalt(_ sender : UIButton){
        sender.blinkAnim(sender: sender)
        if diceKat == 1{
            //Alert Shows
            return
        }else{
            diceKat -= 1
            katLbl.text = String("\(diceKat)D")
        }
    }
    @IBAction func bonusArttir(_ sender : UIButton){
        
        sender.blinkAnim(sender: sender)
        diceBonus += 1
        if diceBonus >= 0{
            bonusLbl.text = String("+\(diceBonus)")
        }else{
            bonusLbl.text = String("\(diceBonus)")
        }
       
        
    }
    @IBAction func bonusAzalt(_ sender : UIButton){
       
        sender.blinkAnim(sender: sender)
        diceBonus -= 1
        if diceBonus >= 0{
            bonusLbl.text = String("+\(diceBonus)")
        }else{
            bonusLbl.text = String("\(diceBonus)")
        }
    }
    
    
    //MARK:-ViewPop and show results
    @objc public func DiceRollAction(_ sender : DiceView){
        
        let dice : DndDice = DndDice(diceCount: diceKat, diceType: sender.diceId, diceBonus: diceBonus)
        
        if let result = dice.roll(){
            
            popView.setData(rawDice: dice, data: result)
            
            self.view.addSubview(popView)
            diceShow = true
            
            for view in self.view.subviews{
                view.isUserInteractionEnabled = false
            }
            
        }
        
       
        
       
            
    }
    //MARK:-Gesture func close pop
    @IBAction func closePop(){
        
        if diceShow == true{
            popView.removeFromSuperview()
            diceShow = false
            
            for view in self.view.subviews{
                view.isUserInteractionEnabled = true
            }
        }
    }
    

}



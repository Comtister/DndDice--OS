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
    
    @IBOutlet var katArttirBtn : UIButton!
    @IBOutlet var katAzaltBtn : UIButton!
    @IBOutlet var bonusArttirBtn : UIButton!
    @IBOutlet var bonusAzaltBtn : UIButton!
    
    @IBOutlet var katLbl : UILabel!
    @IBOutlet var bonusLbl : UILabel!
    
    var diceKat : Int = 1
    var diceBonus : Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
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
            zar.addTarget(self, action: #selector(zare(_:)), for: .touchUpInside)
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
    
    private func btnBlink(sender : UIButton){
        
        let x = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            sender.alpha = 0.5
            
        })
        
        let y = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            sender.alpha = 1.0
        })
       
        x.addCompletion({ _ in
            y.startAnimation()
        })
      
        x.startAnimation()
        
    }
    
    @IBAction func katArttir(_ sender : UIButton) {
            btnBlink(sender: sender)
            diceKat += 1
            katLbl.text = String("\(self.diceKat)D")

        
    }
    @IBAction func katAzalt(_ sender : UIButton){
        
        btnBlink(sender: sender)
        if diceKat == 1{
            //Alert Shows
            return
        }else{
            diceKat -= 1
            katLbl.text = String("\(diceKat)D")
        }
        
        
    }
    @IBAction func bonusArttir(_ sender : UIButton){
        btnBlink(sender: sender)
        diceBonus += 1
        if diceBonus >= 0{
            bonusLbl.text = String("+\(diceBonus)")
        }else{
            bonusLbl.text = String("\(diceBonus)")
        }
       
        
    }
    @IBAction func bonusAzalt(_ sender : UIButton){
        btnBlink(sender: sender)
        diceBonus -= 1
        if diceBonus >= 0{
            bonusLbl.text = String("+\(diceBonus)")
        }else{
            bonusLbl.text = String("\(diceBonus)")
        }
    }
    
    
    @objc public func zare(_ sender : DiceView){
        
      
        
    }
    
   
    
}

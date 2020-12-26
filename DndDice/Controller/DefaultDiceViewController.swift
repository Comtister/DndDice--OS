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
    
    var diceShow : Bool = false
    
    var popView : DicePop!

    override func viewDidLoad() {
        super.viewDidLoad()
       
         popView = DicePop(frame: CGRect(x: 0, y: 0, width: self.view.frame.height/3, height: self.view.frame.height/3))
        
         popView.center = view.center
        
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
            zar.tag = Int(index)
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
        
        //İyileştirilecek
        if diceShow == true{
            diceShow = false
            closePopAnim()
            return
        }

         openPopAnim()
         diceShow = true
        
        if let diceResult = DiceRoller.diceRoll(diceId: sender.tag, extras: (diceKat,diceBonus)){
            print(diceResult)
            popView.diceTitle.text = "\(diceKat)d + \(diceBonus)"
            popView.diceResult.text = "\(diceResult.0)"
            popView.diceValues.text = "\(diceResult.1)"
        }else{
            //Alert Show
        }
            
    }
    
    
    @IBAction func closePop(){
       
        if diceShow == true{
            closePopAnim()
            diceShow = false
        }else{
            return
        }
       
    }
    

}

//MARK:-Animations
extension DefaultDiceViewController{
    
    private func btnBlink(sender : UIButton){
        
        let animOne = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            sender.alpha = 0.5
            
        })
        
        let animTwo = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            sender.alpha = 1.0
        })
        
        animOne.addCompletion({ _ in
            animTwo.startAnimation()
        })
      
        animOne.startAnimation()
        
    }
    
    private func openPopAnim(){
        
        popView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        self.view.addSubview(popView)
        
        let animOp : UIViewPropertyAnimator = UIViewPropertyAnimator.init(duration: 0.05, curve: .linear, animations: {
            //self.popView.frame.size = CGSize(width: self.view.frame.height/3, height: self.view.frame.height/3)
            self.popView.transform = .identity
            //self.popView.alpha = 0.5
        })
        
        
        animOp.startAnimation()
        
    }
    
    private func closePopAnim(){
        
        popView.transform = .identity
        
        let animClose : UIViewPropertyAnimator = UIViewPropertyAnimator(duration: 0.05, curve: .linear, animations: {
            self.popView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
        
        animClose.addCompletion({_ in
            self.popView.removeFromSuperview()
        })
        
        animClose.startAnimation()
        
    }
    
    
   
    
    
    
    
    
}

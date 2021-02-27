//
//  DicePop.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 26.12.2020.
//

import UIKit

class DicePop: UIView {

    @IBOutlet weak var diceTitle: UILabel!
    @IBOutlet weak var diceResult: UILabel!
    @IBOutlet weak var diceValues: UILabel!
    
    override func draw(_ rect: CGRect) {
        self.openAnim()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    override func removeFromSuperview() {
    
        let anim = self.closeAnim()
        
        anim.addCompletion({_ in
            super.removeFromSuperview()
        })
        
        anim.startAnimation()
        
    }
    
    
    
    public func setData(rawDice : DndDice , data : DiceResult){
      
        var bonus : String = ""
        diceValues.text = ""
        diceResult.text = ""
        diceTitle.text = ""
        var resultArrayIndex = 0
        
        if rawDice.diceBonus > 0{
            bonus = String("+\(rawDice.diceBonus)")
        }else if rawDice.diceBonus == 0{
            bonus = ""
        }else{
            bonus = String(rawDice.diceBonus)
        }
       
       
        
        
        diceTitle.text = "\(rawDice.diceCount)\(rawDice.diceType)\(bonus)"
        diceResult.text = String(data.result)
       
        for values in data.results{
            
            if data.results.count != 1{
                
                if  resultArrayIndex + 1 == data.results.count{
                    diceValues.text?.append(String("\(values)"))
                    return
                }
                
                diceValues.text?.append(String("\(values),"))
                
                
            }
            resultArrayIndex += 1
        }
        
    
    }
    
    public func setData(Title : String , data : DiceResult){
      
        diceValues.text = ""
        diceResult.text = ""
        diceTitle.text = ""
        var resultArrayIndex = 0
      
        diceTitle.text = Title
        
        diceResult.text = String(data.result)
       
        for values in data.results{
            
            if data.results.count != 1{
                
                if  resultArrayIndex + 1 == data.results.count{
                    diceValues.text?.append(String("\(values)"))
                    return
                }
                
                diceValues.text?.append(String("\(values),"))
                
                
            }
            resultArrayIndex += 1
        }
        
    
    }
    
    
   
    func loadView(){
    
        let view = Bundle.main.loadNibNamed("DicePop", owner: self, options: nil)![0] as! UIView
        view.frame = self.bounds
        view.layer.cornerRadius = 10
        addSubview(view)
       
    }
   
    //MARK:-Animation Functions
    private func openAnim(){
        
        self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        
        let openAnim = UIViewPropertyAnimator(duration: 0.05, curve: .linear, animations: {
            self.transform = .identity
        })
        
        openAnim.startAnimation()
        
    }
    
    private func closeAnim() ->UIViewPropertyAnimator {
        
    let closeAnim = UIViewPropertyAnimator(duration: 0.05, curve: .linear, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
                
            return closeAnim
    }
    

}

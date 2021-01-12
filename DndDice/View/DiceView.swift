//
//  DiceView.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 2.12.2020.
//

import UIKit



class DiceView: UIControl{
   
    @IBOutlet weak var image : UIImageView!
    @IBOutlet weak var topForm : UIView!
    @IBOutlet weak var bottomForm : UIView!
    
    var diceId : DiceType!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit(){
        
        let view = Bundle.main.loadNibNamed("DiceView", owner: self, options: nil)![0] as! UIControl
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(zar(sender:)))
        addGestureRecognizer(tapGesture)
        view.backgroundColor = UIColor(named: "BackgroundGray")
        topForm.layer.cornerRadius = 3
        bottomForm.layer.cornerRadius = 3
        isUserInteractionEnabled = true
        view.frame = self.bounds
        addSubview(view)
        
    }
    
    @objc func zar(sender : UITapGestureRecognizer){
        if sender.state == .ended{
        sendActions(for: .touchUpInside)
       }
       
    }
   
    
    override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
       super.sendAction(action, to: target, for: event)
        
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.topForm.alpha = 0.3
            self.bottomForm.alpha = 0.3
            
        })
        UIView.animate(withDuration: 0.5, animations: {
            
            self.topForm.alpha = 1
            self.bottomForm.alpha = 1
            
        })
        
    }
   
  
    
}



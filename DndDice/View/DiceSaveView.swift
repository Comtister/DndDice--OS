//
//  DiceSaveView.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 14.01.2021.
//

import UIKit

class DiceSaveView: UIView {
    
    @IBOutlet var diceTypeForwardBtn : UIButton!
    @IBOutlet var diceTypeBackwardBtn : UIButton!
   
    @IBOutlet var diceCountForwardBtn : UIButton!
    @IBOutlet var diceCountBackwardBtn : UIButton!
    
    @IBOutlet var diceBonusForwardBtn : UIButton!
    @IBOutlet var diceBonusBackwardBtn : UIButton!

    @IBOutlet var diceAddBtn : UIButton!
    
    @IBOutlet var diceImage : UIImageView!
    
    var delegate : DiceSaveViewDelegate?
   
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.loadView()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.loadView()
    }
    
    
    private func loadView(){
        
        let view : UIView = Bundle.main.loadNibNamed("DiceSaveView", owner: self, options: nil)![0] as! UIView
        
        view.frame = self.bounds
        addSubview(view)
        
        diceTypeForwardBtn.layer.cornerRadius = 5
        diceTypeBackwardBtn.layer.cornerRadius = 5
        diceCountForwardBtn.layer.cornerRadius = 5
        diceCountBackwardBtn.layer.cornerRadius = 5
        diceBonusForwardBtn.layer.cornerRadius = 5
        diceBonusBackwardBtn.layer.cornerRadius = 5
        
        
        diceTypeForwardBtn.addTarget(self, action: #selector(diceTypeForward), for: .touchUpInside)
        diceTypeBackwardBtn.addTarget(self, action: #selector(diceTypeBackward), for: .touchUpInside)
        diceCountForwardBtn.addTarget(self, action: #selector(diceCountForward), for: .touchUpInside)
        diceCountBackwardBtn.addTarget(self, action: #selector(diceCountBackward), for: .touchUpInside)
        diceBonusForwardBtn.addTarget(self, action: #selector(diceBonusForward), for: .touchUpInside)
        diceBonusBackwardBtn.addTarget(self, action: #selector(diceBonusBackward), for: .touchUpInside)
        diceAddBtn.addTarget(self, action: #selector(diceAdd), for: .touchUpInside)
        
    }
    
   @objc func diceTypeForward(){
    diceTypeForwardBtn.blinkAnim(sender: self.diceTypeForwardBtn)
    delegate?.diceTypeForwadwark(sender: self)
        
    }
    @objc func diceTypeBackward(){
        diceTypeBackwardBtn.blinkAnim(sender: self.diceTypeBackwardBtn)
        delegate?.diceTypeBackwark(sender: self)
         
     }
     
    @objc func diceCountForward(){
        diceCountForwardBtn.blinkAnim(sender: self.diceCountForwardBtn)
        delegate?.diceCountForwadwark(sender: self)
         
     }
     
    @objc func diceCountBackward(){
        diceCountBackwardBtn.blinkAnim(sender: self.diceCountBackwardBtn)
        delegate?.diceCountBackwark(sender: self)
         
     }
     
    @objc func diceBonusForward(){
        diceBonusForwardBtn.blinkAnim(sender: self.diceBonusForwardBtn)
        delegate?.diceBonusForwadwark(sender: self)
         
     }
     
    @objc func diceBonusBackward(){
        diceBonusBackwardBtn.blinkAnim(sender: self.diceBonusBackwardBtn)
        delegate?.diceBonusBackwark(sender: self)
         
     }
    
    @objc func diceAdd(){
        diceAddBtn.blinkAnim(sender: self.diceAddBtn)
        delegate?.diceAdd(sender: self)
    }
     
    
    
    
    
    
    
    
    
    

}

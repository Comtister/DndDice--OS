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
    @IBOutlet weak var diceValues: UITextView!
    
    override func draw(_ rect: CGRect) {
        print("Has Has")
        self.openAnim()
    }
    
    override func removeFromSuperview() {
        let anim = self.closeAnim()
        
        anim.addCompletion({_ in
            super.removeFromSuperview()
        })
        
        anim.startAnimation()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
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
    
    private func closeAnim() -> UIViewPropertyAnimator{
        
        let closeAnim = UIViewPropertyAnimator(duration: 0.05, curve: .linear, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        })
        
        return closeAnim
        
    }
    

}

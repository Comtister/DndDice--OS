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

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        setZarStack()
        
        bottomStackView.isLayoutMarginsRelativeArrangement = true
        bottomStackView.layoutMargins = UIEdgeInsets(top: 0, left:10, bottom: 0, right: 10)
        
    
    }
    
    
    @objc public func zare(_ sender : DiceView){
        
      
        
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
    
}

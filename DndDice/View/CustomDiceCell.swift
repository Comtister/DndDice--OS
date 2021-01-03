//
//  CustomDiceCell.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 2.01.2021.
//

import UIKit

class CustomDiceCell: UITableViewCell {
    
    
    @IBOutlet var diceTitleLbl : UILabel!
    @IBOutlet var diceNumLbl : UILabel!

    var diceData : DndDice!{
        didSet{
            setView()
        }
    }
  
    private var selectedState : Bool = false
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.layer.cornerRadius = 5
        contentView.backgroundColor = .systemGray5
        self.backgroundColor = UIColor(named: "BackgroundGray")
        
        
       
    }
    
    private func setView(){
        
        var label : String = String()
        
        label.append(String(diceData.diceCount))
        label.append(diceData.diceType.description)
        
        if let bonus = diceData.diceBonus{
            
            if bonus > 0{
                label.append("+\(bonus)")
            }else{
                label.append("\(bonus)")
            }
            
        }
        diceNumLbl.text = label
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5))
       
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectedBackgroundView?.backgroundColor = UIColor(named: "BackgroundGray")
        
        if selected == true && selectedState == false{
            
            selectAnim()
        }
        
        selectedState = selected
            
        
      
    }
    
    
    private func selectAnim(){
       
        let firstAnim = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            self.contentView.alpha = 0.3
        })
        
        let secondAnim = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            self.contentView.alpha = 1
        })
        
        firstAnim.addCompletion({_ in
            secondAnim.startAnimation()
        })
        
        firstAnim.startAnimation()
        
    }
    
    
}

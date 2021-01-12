//
//  ViewExtensions.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 12.01.2021.
//

import Foundation
import UIKit

extension UIButton{
    
    public func blinkAnim(sender : UIButton){
        
        let animOne = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            self.alpha = 0.5
            
        })
        
        let animTwo = UIViewPropertyAnimator(duration: 0.1, curve: .linear, animations: {
            self.alpha = 1.0
        })
        
        animOne.addCompletion({ _ in
            animTwo.startAnimation()
        })
      
        animOne.startAnimation()
        
    }
    
   
}

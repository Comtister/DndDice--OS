//
//  ControllerExtensions.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 3.01.2021.
//

import Foundation
import UIKit

//MARK:- CustomDiceViewController
extension CustomDiceViewController{
    
    func setTableButton(object : UIButton ,x : CGFloat , y : CGFloat, width : CGFloat , height : CGFloat ){
        
        self.view.addSubview(object)
        object.translatesAutoresizingMaskIntoConstraints = false
        object.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -x).isActive = true
        object.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -y).isActive = true
        object.heightAnchor.constraint(equalToConstant: height).isActive = true
        object.widthAnchor.constraint(equalToConstant: width).isActive = true
        
        object.backgroundColor = UIColor(named: "BarBackgroundColor")
        object.layer.cornerRadius = 10
        object.setTitle("Add Dice", for: .normal)
        object.setTitleColor(.white, for: .normal)
        
        self.view.bringSubviewToFront(object)
        object.addTarget(self, action: #selector(saveScreen(_:)), for: .touchUpInside)
        
        
    }
    
    
}


//
//  DiceSaveViewController.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 13.01.2021.
//

import UIKit

class DiceSaveViewController: UIViewController{
    
    
    
    @IBOutlet var cancelBtn : UIButton!
    @IBOutlet var saveBtn : UIButton!
    @IBOutlet var topStackView : UIStackView!
    @IBOutlet var scrollView : UIScrollView!
    
    var diceSaverArray : [DiceSaveView] = [DiceSaveView]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //Touch Gesture Delay Disabled
        scrollView.delaysContentTouches = false
        setupScreen()
        
       
        
        
       
    }
    
    private func setupScreen(){
        
        let v1 : DiceSaveView = DiceSaveView(frame: CGRect(x: 0, y: 0, width: Int(scrollView.contentSize.width), height: Int(self.view.bounds.height) / 2))
        
        v1.delegate = self
        
        topStackView.addArrangedSubview(v1)
        diceSaverArray.append(v1)
        
        cancelBtn.layer.cornerRadius = 5
        saveBtn.layer.cornerRadius = 5
        
        
    }
    
    @IBAction func saveDice(){
        
        
        
        
    }
    
  
    @IBAction func closeScreen(_ sender : UIButton){
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
    

}

extension DiceSaveViewController : DiceSaveViewDelegate{
    
    func diceTypeBackwark(sender: DiceSaveView) {
        print("Devredildi")
    }
    
    func diceTypeForwadwark(sender: DiceSaveView) {
        
    }
    
    func diceCountBackwark(sender: DiceSaveView) {
        
    }
    
    func diceCountForwadwark(sender: DiceSaveView) {
        
    }
    
    func diceBonusBackwark(sender: DiceSaveView) {
        
    }
    
    func diceBonusForwadwark(sender: DiceSaveView) {
        
    }
    
    func diceAdd(sender: DiceSaveView) {
        
        if sender === diceSaverArray[0]{
            
            sender.diceAddBtn.isEnabled = false
            sender.diceAddBtn.backgroundColor = .systemGray6
            
        }
        
        
        
        let v1 : DiceSaveView = DiceSaveView(frame: CGRect(x: 0, y: 0, width: Int(scrollView.contentSize.width), height: Int(self.view.bounds.height) / 2))
        
        v1.delegate = self
        
        topStackView.addArrangedSubview(v1)
        diceSaverArray.append(v1)
        
        
    }
    
}



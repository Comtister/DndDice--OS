//
//  CustomDiceViewController.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 11.11.2020.
//

import UIKit

class CustomDiceViewController: UIViewController,UITabBarDelegate,UITableViewDataSource, UITableViewDelegate {
    
    var addButon : UIButton!
    
    @IBOutlet var tableView : UITableView!
    @IBOutlet var tapGesture : UITapGestureRecognizer!
    
    var data : [DndDice] = [DndDice]()
    
    var popView : DicePop!
    var isPopOpen : Bool = false
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        popView = DicePop(frame: CGRect(x: 0, y: 0, width: self.view.frame.height/3, height: self.view.frame.height/3))
       
        popView.center = view.center
        
        tapGesture.cancelsTouchesInView = false
        
        let dice = DndDice(diceCount: 1, diceType: .d6, diceBonus: 0)
        
        
        data.append(dice)
        
        addButon = UIButton()
        setTableButton(object: addButon, x: 20, y: 20, width: 100, height: 50)
        
        tableView.delegate = self
        tableView.dataSource = self
      
        
       
    }
    
    @IBAction func tap(_ sender : UITapGestureRecognizer){
      
        if isPopOpen{
           
            popView.removeFromSuperview()
            isPopOpen = false
            for view in self.view.subviews{
                view.isUserInteractionEnabled = true
            }

        }
    
    }
    
    
    @objc func saveScreen(_ sender : UIButton){
        
       
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomDiceCell{
            
            cell.diceData = data[indexPath.row]
            
            return cell
            
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        isPopOpen = true
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        for view in self.view.subviews{
            view.isUserInteractionEnabled = false
        }
        
        if let cell = tableView.cellForRow(at: indexPath) as? CustomDiceCell{
            
            
            self.view.addSubview(popView)
            
        }
        
    
    }
    
    
  

}

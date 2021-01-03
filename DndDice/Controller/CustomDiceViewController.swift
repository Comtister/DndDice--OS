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
    
    var data : [DndDice] = [DndDice]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dice = DndDice(diceId: 1, diceCount: 1, diceType: .d6, diceBonus: 0)
        
        data.append(dice)
        
        setBtn()
        
        tableView.delegate = self
        tableView.dataSource = self
      
        
       
    }
    
    private func setBtn(){
        
        addButon = UIButton()
        
        self.view.addSubview(addButon)
        addButon.translatesAutoresizingMaskIntoConstraints = false
        addButon.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        addButon.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        addButon.heightAnchor.constraint(equalToConstant: 50).isActive = true
        addButon.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        addButon.backgroundColor = .systemGray5
        addButon.layer.cornerRadius = 10
        addButon.setTitle("Add Dice", for: .normal)
        addButon.setTitleColor(.black, for: .normal)
        
        self.view.bringSubviewToFront(addButon)
        addButon.addTarget(self, action: #selector(saveScreen(_:)), for: .touchUpInside)
        
    }
    
    @objc func saveScreen(_ sender : UIButton){
        
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomDiceCell{
            
            cell.diceTitleLbl.text = "Fire Blast"
            cell.diceNumLbl.text = String("\(data[indexPath.row].diceCount),\(data[indexPath.row].diceType)")
            
            return cell
            
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
        
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let cell = tableView.cellForRow(at: indexPath) as? CustomDiceCell{
            
            
            
        }
        
    
    }

  

}

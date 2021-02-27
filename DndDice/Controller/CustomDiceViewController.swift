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
    @IBOutlet var longPressGesture : UILongPressGestureRecognizer!
    
    var data : [CustomDndDice] = [CustomDndDice]()
    
    var popView : DicePop!
    var isPopOpen : Bool = false
    
    let db = DatabaseManager.createOrOpenDatabase()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        popView = DicePop(frame: CGRect(x: 0, y: 0, width: self.view.frame.height/3, height: self.view.frame.height/3))
        
        popView.center.x = view.center.x
        popView.center.y = view.center.y - popView.frame.height / 2
        
        tapGesture.cancelsTouchesInView = false
        
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(longPress(_:)))
        
        addButon = UIButton()
        setTableButton(object: addButon, x: 20, y: 20, width: 100, height: 50)
        addButon.addTarget(self, action: #selector(saveScreen(_:)), for: .touchUpInside)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.addGestureRecognizer(longPressGesture)
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setData()
    }
    
    @IBAction func unwind(_ segue : UIStoryboardSegue){
        
        setData()
        
    }
    
     public func setData(){
            print("GİRDİ")
         data = db.fetchData()
         tableView.reloadData()
        
    }
    
    @objc func longPress(_ sender : UILongPressGestureRecognizer){
        
        if longPressGesture.state == .began{
            
            let point = longPressGesture.location(in: tableView)
            let touchIndex = tableView.indexPathForRow(at: point)!
            
            let deletingDiceId = data[touchIndex.row].diceId
            
            let alert = UIAlertController(title: String("Remove \(data[touchIndex.row].diceName)"), message: "are you sure you want to remove", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {_ in
                self.db.deleteData(id: deletingDiceId)
                self.data.remove(at: touchIndex.row)
                
                self.tableView.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            print(touchIndex)
            
        }
        
        
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
        sender.blinkAnim(sender: sender)
        performSegue(withIdentifier: "goDiceSave", sender: nil)
       
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CustomDiceCell{
            
            cell.setTexts(Dice: data[indexPath.row])
            
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
        
        if let result : DiceResult = data[indexPath.row].roll() , result.result > 0{
            
            popView.setData(Title: data[indexPath.row].diceName, data: result)
            self.view.addSubview(popView)
            return
        }
        
        let alert = UIAlertController(title: "Ops", message: "Dice result zero", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
       
        
    
    }
    
    
  

}

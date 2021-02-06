//
//  DiceSaveViewController.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 13.01.2021.
//

import UIKit

class DiceSaveViewController: UIViewController{
    
    @IBOutlet var titleLbl : UITextField!
    
    @IBOutlet var cancelBtn : UIButton!
    @IBOutlet var saveBtn : UIButton!
    @IBOutlet var topStackView : UIStackView!
    @IBOutlet var scrollView : UIScrollView!
    
    var chartArray : ChartList = ChartList()
    var dices : [DndDice] = [DndDice]()
    
    var dicesArray : [String] = ["d4","d6","d8","d10","d12","d20","d100"]
    var diceCursor : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Touch Gesture Delay Disabled
        scrollView.delaysContentTouches = false
        setupScreen()
        
       
    }
    
   
    private func setupScreen(){
        //Create and set first dice chart
        let firstChart : DiceSaveView  = DiceSaveView(frame: CGRect(x: 0, y: 0, width: Int(scrollView.contentSize.width), height: Int(self.view.bounds.height) / 2))
        
        firstChart.setDeleteButtonVisibility(bool : false)
        
        firstChart.diceImage.image = UIImage(named: dicesArray[0])
        
        firstChart.delegate = self
        
        topStackView.addArrangedSubview(firstChart)
        chartArray.addChart(chart: firstChart, dice: DndDice(diceCount: 1, diceType: .d4, diceBonus: 0), instances: DiceInstances())
        
        //Set View
        cancelBtn.layer.cornerRadius = 5
        saveBtn.layer.cornerRadius = 5
        
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0)
              
    }
    
   
    @IBAction func saveDice(){
       
        if titleLbl.text == ""{
            print("HAHA")
            return
        }
        
        for chart in chartArray.chartArray{
            dices.append(chart.1)
        }
        
        print(dices[0].diceType)
        dices.removeAll()
        
        
    }
    
  
    @IBAction func closeScreen(_ sender : UIButton){
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

}

extension DiceSaveViewController : DiceSaveViewDelegate{
    
    
    func diceTypeBackwark(sender: DiceSaveView) {
       
        let diceData = chartArray.getDice(chart: sender)
        
        guard diceData.1.typeIndex != 0 else {
            return
        }
        
        diceData.1.typeIndex -= 1
        diceData.0.diceType = DiceType(dicesArray[diceData.1.typeIndex])!
        sender.diceImage.image = UIImage(named: dicesArray[diceData.1.typeIndex])
        sender.diceTypeLbl.text = dicesArray[diceData.1.typeIndex]
        chartArray.changeDiceValue(chart: sender, diceData: diceData)
        
        
        
    }
    
    func diceTypeForwadwark(sender: DiceSaveView) {
      
        let diceData = chartArray.getDice(chart: sender)
        
        guard diceData.1.typeIndex != 6 else {
            return
        }
        
       
        diceData.1.typeIndex += 1
        diceData.0.diceType = DiceType(dicesArray[diceData.1.typeIndex])!
        sender.diceImage.image = UIImage(named: dicesArray[diceData.1.typeIndex])
        sender.diceTypeLbl.text = dicesArray[diceData.1.typeIndex]
        chartArray.changeDiceValue(chart: sender, diceData: diceData)
        
    }
    
    func diceCountBackwark(sender: DiceSaveView) {
     
        let diceData = chartArray.getDice(chart: sender)
        
        if diceData.1.count == 1{
            return
        }
        
        diceData.1.count -= 1
        sender.diceCountLbl.text = String("\(diceData.1.count)d")
        chartArray.changeDiceValue(chart: sender, diceData: diceData)
        
    }
    
    func diceCountForwadwark(sender: DiceSaveView) {
        
        let diceData = chartArray.getDice(chart: sender)
        
        diceData.1.count += 1
        sender.diceCountLbl.text = String("\(diceData.1.count)d")
        chartArray.changeDiceValue(chart: sender, diceData: diceData)
        
    }
    
    func diceBonusBackwark(sender: DiceSaveView) {
        
        let diceData = chartArray.getDice(chart: sender)
        
        diceData.1.bonus -= 1
        
        if diceData.1.bonus >= 0{
            sender.diceBonusLbl.text = String("+\(diceData.1.bonus)")
        }else{
            sender.diceBonusLbl.text = String("\(diceData.1.bonus)")

        }
        chartArray.changeDiceValue(chart: sender, diceData: diceData)
        
    }
    
    func diceBonusForwadwark(sender: DiceSaveView) {
        
        let diceData = chartArray.getDice(chart: sender)
        
        diceData.1.bonus += 1
        
        if diceData.1.bonus >= 0{
            sender.diceBonusLbl.text = String("+\(diceData.1.bonus)")
        }else{
            sender.diceBonusLbl.text = String("\(diceData.1.bonus)")

        }
        chartArray.changeDiceValue(chart: sender, diceData: diceData)
        
    }
    
    func diceAdd(sender: DiceSaveView) {
        
        if sender === chartArray.getChart(at: 0){
            
            sender.diceAddBtn.isEnabled = false
            sender.diceAddBtn.backgroundColor = .systemGray6
        }
        
        let chart : DiceSaveView = DiceSaveView(frame: CGRect(x: 0, y: 0, width: Int(scrollView.contentSize.width), height: Int(self.view.bounds.height) / 2))
        chart.diceImage.image = UIImage(named: dicesArray[0])
        
        chart.delegate = self
        
        topStackView.addArrangedSubview(chart)
        chartArray.addChart(chart: chart, dice: DndDice(diceCount: 1, diceType: .d4, diceBonus: 0), instances: DiceInstances())
        print(chart)
        let aboveIndex = chartArray.getIndex(chart: chart)
        
        if aboveIndex! - 1 == 0{
            return
        }else{
            let aboveChart = chartArray.getChart(at: aboveIndex! - 1)!
            aboveChart.setAddButtonVisibility(bool: false)
        }
        print(chart)
    }
    
    func diceDelete(sender: DiceSaveView) {
        //Bug var düzelt
        let aboveIndex = chartArray.getIndex(chart: sender)
        
        if aboveIndex! == 0{
            return
        }else{
            let aboveChart = chartArray.getChart(at: aboveIndex! - 1)!
            aboveChart.setAddButtonVisibility(bool: true)
        }
        
        
        
        
        if chartArray.removeChart(chart: sender) == 1{
            chartArray.getChart(at: 0)?.diceAddBtn.isEnabled = true
        }
       
      
        
        sender.removeFromSuperview()
       
        
    }
    
    
}



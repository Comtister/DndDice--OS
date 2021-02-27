//
//  ViewController.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 30.10.2020.
//

import UIKit
import MaterialComponents.MaterialTabs_TabBarView

class ViewController: UIViewController{
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        .lightContent
    }
    
    var tabBar : MDCTabBarView = MDCTabBarView()
    
    @IBOutlet var pageViewController : UIPageViewController!
    
    var pageViewControllor : PageViewController?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Setting TabBar
        setTabBar()
        
    }
 
    //MARK: - Access pageViewController object
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "dahiliSegue") {
            pageViewControllor = (segue.destination as! PageViewController)
               
            }
    }
    
   //MARK: - Setup TabBar
    private func setTabBar(){
        
        tabBar.items = [
        UITabBarItem(title: "Default Dices", image: nil, tag: 0),
        UITabBarItem(title: "Custom Dices", image: nil, tag: 1)
        ]
        
        //Setup TabBar
        view.addSubview(tabBar)
        tabBar.tabBarDelegate = self
        tabBar.delegate = self
        tabBar.isScrollEnabled = false
        tabBar.preferredLayoutStyle = .fixed
        tabBar.barTintColor = UIColor(named: "BarBackgroundColor")
        tabBar.selectionIndicatorStrokeColor = UIColor(named: "BarIndicatorColor")
        tabBar.setTitleColor(.white, for: .normal)
        //Set constrains
        tabBar.setSelectedItem(tabBar.items[0], animated: true)
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        tabBar.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        tabBar.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.08).isActive = true
        tabBar.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        tabBar.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
    }
    
   public func setSelectedItem(itemNo anahtar : Int){
        
        if anahtar == 0{
            tabBar.setSelectedItem(tabBar.items[anahtar], animated: true)
            return
        }
        if anahtar == 1{
            tabBar.setSelectedItem(tabBar.items[anahtar], animated: true)
            return
        }
    }
    


}

extension ViewController : MDCTabBarViewDelegate,UIScrollViewDelegate{
    
    func tabBarView(_ tabBarView: MDCTabBarView, didSelect item: UITabBarItem) {
        if item == tabBar.items[0]{
          
            pageViewControllor?.setView(sayfaNo: 0)
        }else{
            pageViewControllor?.setView(sayfaNo: 1)
           
        }
    }
    
    
    
    
}


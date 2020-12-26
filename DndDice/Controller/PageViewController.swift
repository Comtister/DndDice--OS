//
//  PageViewController.swift
//  DndDice
//
//  Created by Oguzhan Ozturk on 11.11.2020.
//

import UIKit

class PageViewController: UIPageViewController {
    
    let views : [UIViewController] = [UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "DefaultDiceController"),UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CustomDiceController")]
    
    var parentController : ViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        delegate = self
        
        setViewControllers([views[0]], direction: .forward, animated: true, completion: nil)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Get Parent
        parentController = self.parent as? ViewController
    }
    
    func setView(sayfaNo anahtar : Int){
      
        anahtar == 0 ? setViewControllers([views[anahtar]], direction: .reverse, animated: true, completion: nil) : setViewControllers([views[anahtar]], direction: .forward, animated: true, completion: nil)
        
    }
    
}
//MARK: - return child view controllers
extension PageViewController : UIPageViewControllerDataSource,UIPageViewControllerDelegate{
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
           
        if viewController == views[0]{
           
            parentController?.setSelectedItem(itemNo: 0)
            return nil
        }else{
           
            
            return views[0]
        }
        
        
       
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
      
        if viewController == views[1]{
           
            parentController?.setSelectedItem(itemNo: 1)
           
            return nil
        }else{
           
            return views[1]
        }
        
       
    }
    
}



//
//  MainVC.swift
//  PathFinder
//
//  Created by hyeoktae kwon on 2019/07/25.
//  Copyright © 2019 hyeoktae kwon. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
  
  override func loadView() {
    view = MainView()
    print("MainVC's View = ", view)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}

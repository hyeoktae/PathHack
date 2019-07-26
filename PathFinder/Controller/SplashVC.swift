//
//  SplashVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import Firebase


class SplashVC: UIViewController {
  private var timer: Timer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startSplash), userInfo: nil, repeats: false)
    
  }
  
  @objc private func startSplash() {
    getCrimeDatas()
  }
  
  private func getCrimeDatas() {
    let db = Firestore.firestore()
    db.collection("Crime").getDocuments { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          print("\(document.documentID) => \(document.data())")
        }
        let mainVC = MainVC()
        self.present(mainVC, animated: false)
      }
    }
  }
}

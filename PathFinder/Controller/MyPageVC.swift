//
//  MyPageVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {
  
  private let myPageView: MyPageView = {
    let myPageView = MyPageView()
    myPageView.translatesAutoresizingMaskIntoConstraints = false
    return myPageView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    setupMyPageView()
  }
  
  private func setupMyPageView() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(myPageView)
    myPageView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    myPageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    myPageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    myPageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

//
//  SplashVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import Firebase
import GoogleMaps

class SplashVC: UIViewController {
  private let shared = DataProvider.shared
  
  private var timer: Timer!
  
  private let mainView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let circleView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.appColor(.moongCherColor)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let titleText: UILabel = {
    let label = UILabel()
    label.text = "moongcher"
    label.font = UIFont.systemFont(ofSize: 48, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let subText: UILabel = {
    let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
    label.text = "긴급 상황 발생 시 화면을 터치하세요"
    label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor.appColor(.moongCherColor)
    setupProperties()
    
    timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(startSplash), userInfo: nil, repeats: false)
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    circleView.layer.cornerRadius = circleView.frame.width / 2
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
          self.shared.crimeDocument.append(document.documentID)

          let data = CrimeModel(
            postion: document["position"] as! [CGFloat],
            location: document["location"] as! String,
            type: document["type"] as! String,
            date: document["date"] as! String,
            state: document["state"] as! String,
            caseNumber: document["caseNumber"] as! String,
            districtPliceStation: document["districtPliceStation"] as! [String],
            reward: document["reward"] as! [Int]
          )
          self.shared.crimeData.append(data)
        }
        let mainVC = MainVC()
        self.present(mainVC, animated: false)
      }
    }
  }
  
  private func setupProperties() {
    let guide = view.safeAreaLayoutGuide
    let margin: CGFloat = 10
    
    view.addSubview(mainView)
    mainView.topAnchor.constraint(equalTo: guide.topAnchor, constant: margin * 3).isActive = true
    mainView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    mainView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    mainView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -margin * 3).isActive = true
    
    view.addSubview(circleView)
    circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    circleView.widthAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
    circleView.heightAnchor.constraint(equalTo: circleView.widthAnchor).isActive = true
    
    
    view.addSubview(titleText)
    titleText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    titleText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    view.addSubview(subText)
    subText.topAnchor.constraint(equalTo: titleText.bottomAnchor).isActive = true
    subText.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    subText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
}

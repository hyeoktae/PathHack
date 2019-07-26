//
//  CommunityVC.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import Firebase

class CommunityVC: UIViewController {
  
  private let tableView = UITableView()
  
  var documentID: String = ""
  
  var data = [CommunityModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    navigationSet()
    configure()
    autoLayout()
    getCrimeCommunityDatas()
  }
  
  private func getCrimeCommunityDatas() {
    let db = Firestore.firestore()
    db.collection("Crime").document(documentID).collection("Community").getDocuments { (querySnapshot, err) in
      if let err = err {
        print("Error getting documents: \(err)")
      } else {
        for document in querySnapshot!.documents {
          
          let temp = CommunityModel(
            title: document["title"] as! String,
            contents: document["contents"] as! String
            )
          self.data.append(temp)
        }
        self.tableView.reloadData()
      }
    }
  }
  
  private func navigationSet() {
    navigationItem.title = "커뮤니티"
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor = .white
    
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "뒤로가기", style: .done, target: self, action: #selector(dismissButtonAction))
  }
  
  @objc private func dismissButtonAction() {
    presentingViewController?.dismiss(animated: true)
  }
  
  private func configure() {
    tableView.dataSource = self
    tableView.register(CommunityCell.self, forCellReuseIdentifier: CommunityCell.identifier)
    view.addSubview(tableView)
  }
  
  private struct Standard {
    static let space: CGFloat = 10
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
}

extension CommunityVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CommunityCell.identifier, for: indexPath) as? CommunityCell else { fatalError() }
    
    cell.setting(data: data[indexPath.row])
    
    return cell
  }
}

//
//  CommunityVC.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class CommunityVC: UIViewController {
  
  private let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    navigationSet()
    configure()
    autoLayout()
  }
  
  private func navigationSet() {
    navigationItem.title = "커뮤니티"
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.barTintColor = .white
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
    return 100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CommunityCell.identifier, for: indexPath) as? CommunityCell else { fatalError() }
    
    cell.setting()
    
    return cell
  }
}

//
//  MyPageView.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageView: UIView {
  let myPageTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(MyPageHeaderCell.self, forCellReuseIdentifier: MyPageHeaderCell.identifier)
    tableView.register(MyPageOneContentCell.self, forCellReuseIdentifier: MyPageOneContentCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    setupMyPageContentView()
    setupTableView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  private func setupMyPageContentView() {
    myPageTableView.separatorStyle = .none
    
    addSubview(myPageTableView)
    myPageTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    myPageTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    myPageTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    myPageTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  private func setupTableView() {
    myPageTableView.dataSource = self
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MyPageView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: MyPageHeaderCell.identifier, for: indexPath) as! MyPageHeaderCell
      cell.selectionStyle = .none
      return cell
    default:
      let cell = tableView.dequeueReusableCell(withIdentifier: MyPageOneContentCell.identifier, for: indexPath) as! MyPageOneContentCell
      cell.selectionStyle = .none
      cell.firstContentLabel.text = "맴버십 포인트 정보"
      cell.firstCountLabel.isHidden = true
      return cell
    }
  }
}

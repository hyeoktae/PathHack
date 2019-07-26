//
//  DetailType3Cell.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class DetailType3Cell: UITableViewCell {
  
  static let identifier = "DetailType3Cell"
  
  private let titleLabel = UILabel()
  private let cashLabel = UILabel()
  private let appLabel = UILabel()
  private let penaltyLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configure()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setting(data: [Int]) {
    titleLabel.text = "포상"
    
    if data[0] == 0 {
      cashLabel.text = "    - " + "해당사항 없음"
    } else {
      cashLabel.text = "    - " + String(data[0])
    }
    
    if data[1] == 0 {
      appLabel.text = "    - " + "해당사항 없음"
    } else {
      appLabel.text = "    -  " + String(data[1])
    }
    
    if data[2] == 0 {
      penaltyLabel.text = "    - " + "해당사항 없음"
    } else {
      penaltyLabel.text = "    -  " + String(data[2])
    }
  }
  
  private func configure() {
    self.selectionStyle = .none
    
    
    contentView.addSubview(titleLabel)
    
    
    contentView.addSubview(cashLabel)
    
    
    contentView.addSubview(appLabel)
    
    
    contentView.addSubview(penaltyLabel)
  }
  
  private struct Standard {
    static let xSpace: CGFloat = 10
    static let ySpace: CGFloat = 10
  }
  
  private func autoLayout() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Standard.ySpace).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.xSpace).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    
    cashLabel.translatesAutoresizingMaskIntoConstraints = false
    cashLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    cashLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.xSpace).isActive = true
    cashLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    
    appLabel.translatesAutoresizingMaskIntoConstraints = false
    appLabel.topAnchor.constraint(equalTo: cashLabel.bottomAnchor).isActive = true
    appLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.xSpace).isActive = true
    appLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    
    penaltyLabel.translatesAutoresizingMaskIntoConstraints = false
    penaltyLabel.topAnchor.constraint(equalTo: appLabel.bottomAnchor).isActive = true
    penaltyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.xSpace).isActive = true
    penaltyLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    penaltyLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Standard.ySpace).isActive = true
  }
  
}

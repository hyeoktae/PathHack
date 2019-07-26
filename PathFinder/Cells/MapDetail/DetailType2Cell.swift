//
//  DetailType2Cell.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class DetailType2Cell: UITableViewCell {
  
  static let identifier = "DetailType2Cell"
  
  private let titleLabel = UILabel()
  private let nameLabel = UILabel()
  private let numberLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configure()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setting(data: [String]) {
    titleLabel.text = "관할 경찰서"
    nameLabel.text = "    - " + data[0]
    numberLabel.text = "    - " + data[1]
  }
  
  private func configure() {
    self.selectionStyle = .none
    
    
    contentView.addSubview(titleLabel)
    
    
    contentView.addSubview(nameLabel)
    
    
    contentView.addSubview(numberLabel)
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
    
    
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
    nameLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.xSpace).isActive = true
    nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    
    numberLabel.translatesAutoresizingMaskIntoConstraints = false
    numberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    numberLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.xSpace).isActive = true
    numberLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    numberLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Standard.ySpace).isActive = true
  }
  
}

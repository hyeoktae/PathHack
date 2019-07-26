//
//  DetailType1Cell.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class DetailType1Cell: UITableViewCell {
  
  static let identifier = "DetailType1Cell"
  
  let titleLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configure()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    self.selectionStyle = .none
    
    contentView.addSubview(titleLabel)
  }
  
  private struct Standard {
    static let xSpace: CGFloat = 10
    static let ySpace: CGFloat = 10
  }
  
  private func autoLayout() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Standard.ySpace).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.xSpace).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Standard.xSpace).isActive = true
    titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Standard.ySpace).isActive = true
  }
}

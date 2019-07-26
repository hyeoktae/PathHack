//
//  DetailMapCell.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class DetailMapCell: UITableViewCell {
  
  static let identifier = "DetailMapCell"
  
  private let tempMap = UIImageView()
  
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
    
    tempMap.image = UIImage(named: "tempLocation")
    contentView.addSubview(tempMap)
  }
  
  private struct Standard {
    static let space: CGFloat = 10
  }
  
  private func autoLayout() {
    tempMap.translatesAutoresizingMaskIntoConstraints = false
    tempMap.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    tempMap.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    tempMap.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    tempMap.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  }
}

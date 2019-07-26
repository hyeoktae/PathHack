//
//  DetailMapCell.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import GoogleMaps

class DetailMapCell: UITableViewCell {
  
  static let identifier = "DetailMapCell"
  
  
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  private struct Standard {
    static let space: CGFloat = 10
  }
}

//
//  RewardStoreCell.swift
//  PathFinder
//
//  Created by Lee on 27/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class RewardStoreCell: UICollectionViewCell {
  
  static let identifier = "RewardStoreCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    
  }
  
  private struct Standard {
    static let space: CGFloat = 10
  }
  
  private func autoLayout() {
    
  }
}

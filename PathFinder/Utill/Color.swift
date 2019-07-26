//
//  Color.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

enum AssetsColor {
  // MegaBox Main Color
  case moongCherColor
  
  // Button Color
  case defaultGrayColor
  
  // Cell Color
  case selectedCellMintColor
  case selectedCellGrayColor
  
  // Dark BG Color
  case darkBgColor
}

extension UIColor {
  static func appColor(_ name: AssetsColor) -> UIColor {
    switch name {
    case .moongCherColor:
      return #colorLiteral(red: 0.5333333333, green: 0.7921568627, blue: 0.8352941176, alpha: 1)
    case .defaultGrayColor:
      return #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    case .selectedCellMintColor:
      return #colorLiteral(red: 0.3098039216, green: 0.7137254902, blue: 0.7607843137, alpha: 1)
    case .selectedCellGrayColor:
      return #colorLiteral(red: 0.9384746552, green: 0.9328956604, blue: 0.9427630305, alpha: 1)
    case .darkBgColor:
      return #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
    }
  }
}

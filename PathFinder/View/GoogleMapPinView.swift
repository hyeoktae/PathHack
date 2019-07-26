//
//  GoogleMapPinView.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class GoogleMapPinView: UIView {
  private let bgImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "balloon")
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let stateImage: UIImageView = {
    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "murder_white")
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupImageViews()
  }
  
  private func setupImageViews() {
    let margin: CGFloat = 15
    self.addSubview(bgImage)
    bgImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    bgImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    bgImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    bgImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    
    bgImage.addSubview(stateImage)
    stateImage.topAnchor.constraint(equalTo: bgImage.topAnchor, constant: margin).isActive = true
    stateImage.leadingAnchor.constraint(equalTo: bgImage.leadingAnchor, constant: margin).isActive = true
    stateImage.trailingAnchor.constraint(equalTo: bgImage.trailingAnchor, constant: -margin).isActive = true
    stateImage.bottomAnchor.constraint(equalTo: bgImage.bottomAnchor, constant: -20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

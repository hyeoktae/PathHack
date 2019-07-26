//
//  CompareFaceView.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

protocol CompareImageViewDelegate: class {
  func didTapLabeler()
}

class CompareImageView: UIView {
  
  lazy var labelBtn: UIButton = {
    let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
    btn.setTitle("labeler", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.addTarget(self, action: #selector(didTapBtn(_:)), for: .touchUpInside)
    return btn
  }()
  
  weak var delegate: CompareImageViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(labelBtn)
  }
  
  @objc private func didTapBtn(_ sender: UIButton) {
    delegate?.didTapLabeler()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}


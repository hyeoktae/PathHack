//
//  QuickReportView.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class QuickReportView: UIView {
  //  var delegate: QuickReportVCDelegate?
  
  let topView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    view.alpha = 0.9
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let cancelButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "button_cancel"), for: .normal)
    button.addTarget(self, action: #selector(touchUpCancelButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let bottomImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  @objc private func touchUpCancelButton(_ sender: Any) {
    //    delegate?.touchUpCancelButton()
  }
  
  private func setupProperties() {
    self.addSubview(topView)
    topView.topAnchor.constraint(equalTo: self.topAnchor, constant: -250).isActive = true
    topView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 270).isActive = true
    
    topView.addSubview(cancelButton)
    cancelButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
    cancelButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
    cancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    cancelButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    
    self.addSubview(bottomImageView)
    bottomImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    bottomImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    bottomImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 130).isActive = true
    bottomImageView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 284) / 750).isActive = true
  }
  
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

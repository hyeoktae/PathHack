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
  
  private let topViewText: UILabel = {
    let label = UILabel()
    label.text = """
                허위신고(전화, 문자)를 할 경우에는
                법에 의해 처벌을 받을 수 있습니다.
                """
    label.textColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let cancelButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "button_cancel"), for: .normal)
    button.addTarget(self, action: #selector(touchUpCancelButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var bottomView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let kidnapButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "kidnap"), for: .normal)
    return button
  }()
  
  let kidnapText: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.text = "납치"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let distressButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setImage(#imageLiteral(resourceName: "distress"), for: .normal)
    return button
  }()
  
  let distressText: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.text = "조난"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let incarcerationButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "incarceration"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return button
  }()
  
  let incarcerationText: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.text = "감금"
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let violenceButton: UIButton = {
    let button = UIButton()
    button.setImage(#imageLiteral(resourceName: "violence"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return button
  }()
  
  let violenceText: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.text = "폭행"
    label.textAlignment = .center
    label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let policeCallButton: UIButton = {
    let button = UIButton()
    button.setTitle("112 전화", for:  .normal)
    button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    button.backgroundColor = #colorLiteral(red: 1, green: 0, blue: 0, alpha: 1)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
    policeCallButton.layer.cornerRadius = policeCallButton.frame.width / 2
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    setupProperties()
    
  }
  
  @objc private func touchUpCancelButton(_ sender: Any) {
    //    delegate?.touchUpCancelButton()
  }
  
  private func setupProperties() {
    let buttonWidth = UIScreen.main.bounds.width / 4
    self.addSubview(topView)
    topView.topAnchor.constraint(equalTo: self.topAnchor, constant: -200).isActive = true
    topView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 270).isActive = true
    
    topView.addSubview(topViewText)
    topViewText.topAnchor.constraint(equalTo: topView.topAnchor, constant: 20).isActive = true
    topViewText.leadingAnchor.constraint(equalTo: topView.leadingAnchor).isActive = true
    topViewText.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
    
    topView.addSubview(cancelButton)
    cancelButton.topAnchor.constraint(equalTo: topView.topAnchor).isActive = true
    cancelButton.trailingAnchor.constraint(equalTo: topView.trailingAnchor).isActive = true
    cancelButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    cancelButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
    
    self.addSubview(bottomView)
    bottomView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    bottomView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    bottomView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 130).isActive = true
    bottomView.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width * 284) / 500).isActive = true
    
    bottomView.addSubview(kidnapButton)
    kidnapButton.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    kidnapButton.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
    kidnapButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    
    bottomView.addSubview(kidnapText)
    kidnapText.topAnchor.constraint(equalTo: kidnapButton.bottomAnchor).isActive = true
    kidnapText.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor).isActive = true
    kidnapText.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//    kidnapText.heightAnchor.constraint(equalTo: kidnapButton.heightAnchor).isActive = true
    
    bottomView.addSubview(distressButton)
    distressButton.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    distressButton.leadingAnchor.constraint(equalTo: kidnapButton.trailingAnchor).isActive = true
    distressButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    
    bottomView.addSubview(distressText)
    distressText.topAnchor.constraint(equalTo: distressButton.bottomAnchor).isActive = true
    distressText.leadingAnchor.constraint(equalTo: kidnapText.trailingAnchor).isActive = true
    distressText.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//    distressText.heightAnchor.constraint(equalTo: distressButton.heightAnchor).isActive = true
    
    bottomView.addSubview(incarcerationButton)
    incarcerationButton.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    incarcerationButton.leadingAnchor.constraint(equalTo: distressButton.trailingAnchor).isActive = true
    incarcerationButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    
    bottomView.addSubview(incarcerationText)
    incarcerationText.topAnchor.constraint(equalTo: incarcerationButton.bottomAnchor).isActive = true
    incarcerationText.leadingAnchor.constraint(equalTo: distressText.trailingAnchor).isActive = true
    incarcerationText.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//    incarcerationText.heightAnchor.constraint(equalTo: incarcerationButton.heightAnchor).isActive = true
    
    bottomView.addSubview(violenceButton)
    violenceButton.topAnchor.constraint(equalTo: bottomView.topAnchor).isActive = true
    violenceButton.leadingAnchor.constraint(equalTo: incarcerationButton.trailingAnchor).isActive = true
    violenceButton.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
    violenceButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
    
    bottomView.addSubview(violenceText)
    violenceText.topAnchor.constraint(equalTo: violenceButton.bottomAnchor).isActive = true
    violenceText.leadingAnchor.constraint(equalTo: incarcerationText.trailingAnchor).isActive = true
    violenceText.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor).isActive = true
    violenceText.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
//    violenceText.heightAnchor.constraint(equalTo: violenceButton.heightAnchor).isActive = true
    
    self.addSubview(policeCallButton)
    policeCallButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    policeCallButton.topAnchor.constraint(equalTo: bottomView.bottomAnchor).isActive = true
    policeCallButton.widthAnchor.constraint(equalToConstant: buttonWidth * 2).isActive = true
    policeCallButton.heightAnchor.constraint(equalToConstant: buttonWidth).isActive = true
  }
  
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

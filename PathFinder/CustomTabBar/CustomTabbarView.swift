//
//  CustomTabbar.swift
//  CustomTabbarControllerExample
//
//  Created by Meo MacBook Pro on 22/05/2019.
//  Copyright © 2019 Meo MacBook Pro. All rights reserved.
//

import UIKit

class CustomTabbarView: UIView {
  
  var buttonSize: CGFloat = 70
  var buttonBackImageSize: CGFloat = 0
  
  let contentView: UIView = {
    let contentView = UIView()
    contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    return contentView
  }()
  
  let customTabBar: UITabBar = {
    let customTabBar = UITabBar()
    customTabBar.barTintColor = UIColor.appColor(.moongCherColor)
    customTabBar.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return customTabBar
  }()
  
  let leftStack: ButtonStack = {
    return ButtonStack()
  }()
  
  let rightStack: ButtonStack = {
    return ButtonStack()
  }()
  
  let centerButtonBackImage: UIImageView = {
    return UIImageView()
  }()
  
  let centerButton: UIButton = {
    return UIButton()
  }()
  
  func makeContentViewConstraint() {
    contentView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      contentView.centerXAnchor.constraint(equalTo: centerXAnchor),
      contentView.widthAnchor.constraint(equalTo: widthAnchor),
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.bottomAnchor.constraint(equalTo: customTabBar.topAnchor,constant: -5),
      ])
  }
  
  func makeCustomTabBarConstraint() {
    customTabBar.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      customTabBar.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      customTabBar.centerXAnchor.constraint(equalTo: centerXAnchor),
      customTabBar.widthAnchor.constraint(equalTo: widthAnchor),
      ])
    
  }
  
  
  func makeStackConstraint(targetStack: UIView) {
    targetStack.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      targetStack.heightAnchor.constraint(equalTo: customTabBar.heightAnchor),
      targetStack.widthAnchor.constraint(equalTo: customTabBar.widthAnchor,multiplier: 0.3),
      targetStack.centerYAnchor.constraint(equalTo: customTabBar.centerYAnchor)
      ])
  }
  
  func makeLeftStackConstraint() {
    leftStack.leadingAnchor.constraint(equalTo: customTabBar.leadingAnchor,constant: 16).isActive = true
  }
  
  func makeRightStackConstraint() {
    rightStack.trailingAnchor.constraint(equalTo: customTabBar.trailingAnchor,constant: -16).isActive = true
  }
  
  func makeCenterButtonBackImageConstraint() {
    centerButtonBackImage.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      centerButtonBackImage.centerXAnchor.constraint(equalTo: customTabBar.centerXAnchor),
      centerButtonBackImage.widthAnchor.constraint(equalToConstant: buttonBackImageSize),
      centerButtonBackImage.heightAnchor.constraint(equalTo: centerButtonBackImage.widthAnchor),
      centerButtonBackImage.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -(buttonBackImageSize/2))
      
      ])
  }
  
  func makeCenterButtonConstraint() {
    centerButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      centerButton.centerXAnchor.constraint(equalTo: centerButtonBackImage.centerXAnchor),
      centerButton.centerYAnchor.constraint(equalTo: centerButtonBackImage.centerYAnchor),
      centerButton.widthAnchor.constraint(equalToConstant: buttonSize),
      centerButton.heightAnchor.constraint(equalTo: centerButton.widthAnchor),
      centerButton.topAnchor.constraint(equalTo: customTabBar.topAnchor, constant: -(buttonSize/2))
      
      ])
  }
  
  func makeView() {
    backgroundColor = .white
    addSubview(contentView)
    addSubview(customTabBar)
    addSubview(leftStack)
    addSubview(rightStack)
    addSubview(centerButtonBackImage)
    addSubview(centerButton)
  }
  
  func makeItemConstraints() {
    makeContentViewConstraint()
    makeCustomTabBarConstraint()
    makeStackConstraint(targetStack: leftStack)
    makeLeftStackConstraint()
    makeStackConstraint(targetStack: rightStack)
    makeRightStackConstraint()
    makeCenterButtonBackImageConstraint()
    makeCenterButtonConstraint()
  }
  
  func makeCircleBackButtonImage() {
    centerButtonBackImage.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    centerButtonBackImage.layer.cornerRadius = buttonBackImageSize / 2
  }
  
  func makeCircleBackButton() {
    centerButton.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
    centerButton.layer.cornerRadius = buttonSize / 2
  }
  
  func makeLabelTitle() {
    
    leftStack.firstButton.setTitle("홈", for: .normal)
    leftStack.secondButton.setTitle("페이스", for: .normal)
    
    rightStack.firstButton.setTitle("스토어", for: .normal)
    rightStack.secondButton.setTitle("나의페이지", for: .normal)
  }
  
  func linkTagNumber() {
    leftStack.firstButton.tag = 0
    leftStack.secondButton.tag = 1
    rightStack.firstButton.tag = 2
    rightStack.secondButton.tag = 3
  }
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    buttonBackImageSize = buttonSize + 10
    makeView()
    makeItemConstraints()
    makeLabelTitle()
    makeCircleBackButtonImage()
    makeCircleBackButton()
    linkTagNumber()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}

class ButtonStack: UIView {
  
  let buttonStackView: UIStackView = {
    let buttonStackView = UIStackView()
    buttonStackView.axis = .horizontal
    buttonStackView.distribution = .fillEqually
    return buttonStackView
  }()
  
  let firstButton: UIButton = {
    return UIButton()
  }()
  
  let secondButton: UIButton = {
    return UIButton()
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(buttonStackView)
    
    buttonStackView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      buttonStackView.widthAnchor.constraint(equalTo: widthAnchor),
      buttonStackView.heightAnchor.constraint(equalTo: heightAnchor),
      buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
      buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      ])
    
    buttonStackView.addArrangedSubview(firstButton)
    buttonStackView.addArrangedSubview(secondButton)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}

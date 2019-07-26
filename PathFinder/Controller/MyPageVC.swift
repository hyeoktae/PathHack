//
//  MyPageVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageVC: UIViewController {
  
  private let baseView = UIView()
  private let idView = UIView()
  private let imageView = UIImageView()
  private let idLabel = UILabel()
  private let lineView = UIView()
  private let contentsButton = UIButton()
  private let contentsline = UILabel()
  private let reportButton = UIButton()
  private let reportline = UILabel()
  private let appPointLabel = UILabel()
  private let appPointline = UILabel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    navigationSet()
    configure()
    autoLayout()
  }
  
  private func navigationSet() {
    navigationItem.title = "My Page"
    navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6941176471, green: 0.8666666667, blue: 0.8509803922, alpha: 1)
  }
  
  private func configure() {
    view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    baseView.backgroundColor = .white
    view.addSubview(baseView)
    
    idView.backgroundColor = .white
    idView.layer.cornerRadius = 10
    view.addSubview(idView)
    
    imageView.image = UIImage(named: "profile")
    idView.addSubview(imageView)
    
    idLabel.text = "금정구 보안관"
    idView.addSubview(idLabel)
    
    lineView.layer.cornerRadius = 10
    lineView.layer.borderColor = UIColor.darkGray.cgColor
    lineView.layer.borderWidth = 1
    view.addSubview(lineView)
    
    contentsButton.setTitle("내가 쓴 글", for: .normal)
    contentsButton.setTitleColor(.black, for: .normal)
    contentsButton.backgroundColor = .white
    contentsButton.layer.cornerRadius = 10
    view.addSubview(contentsButton)
    
    contentsline.backgroundColor = .darkGray
    view.addSubview(contentsline)
    
    reportButton.setTitle("내가 신고한 내역", for: .normal)
    reportButton.setTitleColor(.black, for: .normal)
    reportButton.backgroundColor = .white
    reportButton.layer.cornerRadius = 10
    view.addSubview(reportButton)
    
    reportline.backgroundColor = .darkGray
    view.addSubview(reportline)
    
    appPointLabel.text = "내 포인트 : 900"
    appPointLabel.textAlignment = .center
    appPointLabel.backgroundColor = .white
    appPointLabel.layer.cornerRadius = 10
    appPointLabel.layer.masksToBounds = true
    view.addSubview(appPointLabel)
  }
  
  private struct Standard {
    static let space: CGFloat = 10
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    baseView.translatesAutoresizingMaskIntoConstraints = false
    baseView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
    baseView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
    baseView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
    baseView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
    
    idView.translatesAutoresizingMaskIntoConstraints = false
    idView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 70).isActive = true
    idView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 30).isActive = true
    idView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -30).isActive = true
    idView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.centerYAnchor.constraint(equalTo: idView.centerYAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: idView.leadingAnchor, constant: 40).isActive = true
    
    idLabel.translatesAutoresizingMaskIntoConstraints = false
    idLabel.topAnchor.constraint(equalTo: idView.topAnchor).isActive = true
    idLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 30).isActive = true
    idLabel.bottomAnchor.constraint(equalTo: idView.bottomAnchor).isActive = true
    
    lineView.translatesAutoresizingMaskIntoConstraints = false
    lineView.topAnchor.constraint(equalTo: contentsButton.topAnchor, constant: -10).isActive = true
    lineView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 10).isActive = true
    lineView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10).isActive = true
    lineView.bottomAnchor.constraint(equalTo: appPointLabel.bottomAnchor, constant: 10).isActive = true
    
    contentsButton.translatesAutoresizingMaskIntoConstraints = false
    contentsButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    contentsButton.topAnchor.constraint(equalTo: idView.bottomAnchor, constant: 40).isActive = true
    contentsButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    contentsline.translatesAutoresizingMaskIntoConstraints = false
    contentsline.leadingAnchor.constraint(equalTo: lineView.leadingAnchor, constant:  10).isActive = true
    contentsline.trailingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: -10).isActive = true
    contentsline.bottomAnchor.constraint(equalTo: contentsButton.bottomAnchor, constant: 10).isActive = true
    contentsline.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    reportButton.translatesAutoresizingMaskIntoConstraints = false
    reportButton.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    reportButton.topAnchor.constraint(equalTo: contentsButton.bottomAnchor, constant: 20).isActive = true
    reportButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    reportline.translatesAutoresizingMaskIntoConstraints = false
    reportline.leadingAnchor.constraint(equalTo: lineView.leadingAnchor, constant: 10).isActive = true
    reportline.trailingAnchor.constraint(equalTo: lineView.trailingAnchor, constant: -10).isActive = true
    reportline.bottomAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 10).isActive = true
    reportline.heightAnchor.constraint(equalToConstant: 1).isActive = true
    
    appPointLabel.translatesAutoresizingMaskIntoConstraints = false
    appPointLabel.centerXAnchor.constraint(equalTo: guide.centerXAnchor).isActive = true
    appPointLabel.topAnchor.constraint(equalTo: reportButton.bottomAnchor, constant: 20).isActive = true
    appPointLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
}

//
//  RewoadCell.swift
//  PathFinder
//
//  Created by Lee on 27/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

extension UIView {
  func shadow() {
    self.layer.shadowRadius = 5.0
    self.layer.shadowOpacity = 0.3
    self.layer.shadowOffset = .zero
    self.layer.shadowColor = UIColor.darkGray.cgColor
  }
}


class RewoadCell: UICollectionViewCell {
  
  static let identifier = "RewoadCell"
  
  private let baseView = UIView()
  private let titleLabel = UILabel()
  private let imageView = UIImageView()
  private let detailLalel = UILabel()
  private let appPointLabel = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    configure()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setting(data: Store) {
    titleLabel.text = data.commpany
    imageView.image = UIImage(named: data.imageName)
    detailLalel.text = data.detail
    appPointLabel.text = String(data.appPoint) + "  Point"
  }
  
  private func configure() {
    contentView.layer.cornerRadius = 10
    contentView.shadow()
    contentView.backgroundColor = .white
    
    titleLabel.textAlignment = .center
    titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
    contentView.addSubview(titleLabel)
    
    contentView.addSubview(imageView)
    
    detailLalel.textAlignment = .center
    contentView.addSubview(detailLalel)
    
    appPointLabel.textAlignment = .center
    appPointLabel.textColor = .white
    appPointLabel.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
    contentView.addSubview(appPointLabel)
  }
  
  private struct Standard {
    static let space: CGFloat = 10
  }
  
  private func autoLayout() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
    
    detailLalel.translatesAutoresizingMaskIntoConstraints = false
    detailLalel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 40).isActive = true
    detailLalel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    detailLalel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    
    appPointLabel.translatesAutoresizingMaskIntoConstraints = false
    appPointLabel.topAnchor.constraint(equalTo: detailLalel.bottomAnchor, constant: 30).isActive = true
    appPointLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
    appPointLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  }
}

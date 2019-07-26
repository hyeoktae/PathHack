//
//  CommunityCell.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class CommunityCell: UITableViewCell {

  static let identifier = "CommunityCell"
  
  private let titleLabel = UILabel()
  private let contentsLabel = UILabel()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configure()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setting(data: CommunityModel) {
    titleLabel.text = data.title
    contentsLabel.text = data.contents
  }
  
  private func configure() {
    self.selectionStyle = .none
    
    titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
    contentView.addSubview(titleLabel)
    
    contentsLabel.numberOfLines = 0
    contentView.addSubview(contentsLabel)
  }
  
  private struct Standard {
    static let space: CGFloat = 10
  }
  
  private func autoLayout() {
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Standard.space).isActive = true
    titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.space).isActive = true
    titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Standard.space).isActive = true
    
    contentsLabel.translatesAutoresizingMaskIntoConstraints = false
    contentsLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Standard.space).isActive = true
    contentsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.space).isActive = true
    contentsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Standard.space).isActive = true
    contentsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Standard.space).isActive = true
  }
}

//
//  DetailCommunityCell.swift
//  PathFinder
//
//  Created by Lee on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

protocol DetailCommunityCellDelegate: class {
  func CommunityButtonDidTap()
}

class DetailCommunityCell: UITableViewCell {
  
  static let identifier = "DetailCommunityCell"
  
  weak var delegate: DetailCommunityCellDelegate?
  
  private let communityButton = UIButton()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    configure()
    autoLayout()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    communityButton.setTitle("해당 사건 커뮤니티", for: .normal)
    communityButton.setTitleColor(.white, for: .normal)
    communityButton.backgroundColor = .darkGray
    communityButton.layer.cornerRadius = 10
    communityButton.addTarget(self, action: #selector(communityButtonAction), for: .touchUpInside)
    contentView.addSubview(communityButton)
  }
  
  @objc private func communityButtonAction() {
    delegate?.CommunityButtonDidTap()
  }
  
  private struct Standard {
    static let space: CGFloat = 10
  }
  
  private func autoLayout() {
    communityButton.translatesAutoresizingMaskIntoConstraints = false
    communityButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Standard.space).isActive = true
    communityButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Standard.space).isActive = true
    communityButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Standard.space).isActive = true
    communityButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Standard.space).isActive = true
  }
}



//
//  MapDetailVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MapDetailVC: UIViewController {
  private let shared = DataProvider.shared
  var documentID: String = ""
  
  private let backButton = UIButton()
  
  private let googleMap: MapDetailView = {
    let mapView = MapDetailView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    return mapView
  }()
  
  private let tableView = UITableView()
  
  var data: CrimeModel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    configure()
    autoLayout()
    googleMap.configureGoogleMapPosition(data)
  }
  
  private func configure() {
    view.backgroundColor = .white
    
    tableView.separatorStyle = .none
    tableView.dataSource = self
    tableView.register(DetailMapCell.self, forCellReuseIdentifier: DetailMapCell.identifier)
    tableView.register(DetailType1Cell.self, forCellReuseIdentifier: DetailType1Cell.identifier)
    tableView.register(DetailType2Cell.self, forCellReuseIdentifier: DetailType2Cell.identifier)
    tableView.register(DetailType3Cell.self, forCellReuseIdentifier: DetailType3Cell.identifier)
    tableView.register(DetailCommunityCell.self, forCellReuseIdentifier: DetailCommunityCell.identifier)
    view.addSubview(tableView)
    
    backButton.setTitle("  뒤로가기  ", for: .normal)
    backButton.setTitleColor(.white, for: .normal)
    backButton.backgroundColor = .darkGray
    backButton.layer.cornerRadius = 10
    backButton.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
  }
  
  @objc private func backButtonAction() {
    presentingViewController?.dismiss(animated: true)
  }
  
  private struct Standard {
    static let space: CGFloat = 10
  }
  
  private func autoLayout() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(googleMap)
    googleMap.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    googleMap.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    googleMap.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    googleMap.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 3).isActive = true
    
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.topAnchor.constraint(equalTo: googleMap.bottomAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
    view.addSubview(backButton)
    backButton.translatesAutoresizingMaskIntoConstraints = false
    backButton.topAnchor.constraint(equalTo: guide.topAnchor, constant: 10).isActive = true
    backButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 10).isActive = true
  }
}


extension MapDetailVC: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 9
  }
  
  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
      
    //MARK: MapTableViewCell
    case 0:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailMapCell.identifier, for: indexPath) as? DetailMapCell else { fatalError() }
      
      return cell
      
      
    //MARK: Location
    case 1:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailType1Cell.identifier, for: indexPath) as? DetailType1Cell else { fatalError() }
      
      let baseString = "위치 : "
      cell.titleLabel.text = baseString + data.location
      
      return cell
      
      
    //MARK: - Type
    case 2:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailType1Cell.identifier, for: indexPath) as? DetailType1Cell else { fatalError() }
      
      let baseString = "사건 종류 : "
      cell.titleLabel.text = baseString + data.type
      
      return cell
      
      
    //MARK: - Date
    case 3:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailType1Cell.identifier, for: indexPath) as? DetailType1Cell else { fatalError() }
      
      let baseString = "일시 : "
      cell.titleLabel.text = baseString + data.date
      
      return cell
      
      
    //MARK: - State
    case 4:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailType1Cell.identifier, for: indexPath) as? DetailType1Cell else { fatalError() }
      
      let baseString = "현황 : "
      cell.titleLabel.text = baseString + data.state
      
      return cell
      
      
    //MARK: - CaseNumber
    case 5:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailType1Cell.identifier, for: indexPath) as? DetailType1Cell else { fatalError() }
      
      let baseString = "사건번호 : "
      cell.titleLabel.text = baseString + data.caseNumber
      
      return cell
      
      
    //MARK: - PoliceStation
    case 6:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailType2Cell.identifier, for: indexPath) as? DetailType2Cell else { fatalError() }
      
      cell.setting(data: data.districtPliceStation)
      
      return cell
      
      
    //MARK: - Reward
    case 7:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailType3Cell.identifier, for: indexPath) as? DetailType3Cell else { fatalError() }
      
      cell.setting(data: data.reward)
      
      return cell
      
      
    //MARK: -
    default:
      guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCommunityCell.identifier, for: indexPath) as? DetailCommunityCell else { fatalError() }
      
      cell.delegate = self
      
      return cell
    }
  }
}

extension MapDetailVC: DetailCommunityCellDelegate {
  func CommunityButtonDidTap() {
    
    print("hi")
    let communityVC = CommunityVC()
    communityVC.documentID = documentID
    
    let navi = UINavigationController(rootViewController: communityVC)
    
    present(navi, animated: true)
  }
}

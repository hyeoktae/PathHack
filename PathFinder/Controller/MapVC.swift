//
//  MapVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import GoogleMaps

class MapVC: UIViewController {
  
  private let shared = DataProvider.shared
  
  private let googleMap: MapView = {
    let mapView = MapView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    return mapView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    googleMap.delegate = self
    
    setupGoogleMaps()
    googleMap.configureMapView(shared.crimeData)
  }
  
  private func setupGoogleMaps() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(googleMap)
    googleMap.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    googleMap.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    googleMap.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    googleMap.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension MapVC: MapViewDelegate {
  func touchUpMarker(_ crimeData: CrimeModel, _ documentValue: String) {
    let mapDetailVC = MapDetailVC()
    mapDetailVC.data = crimeData
    mapDetailVC.documentID = documentValue
  }
}

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
  
  private let googleMap: MapView = {
    let mapView = MapView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    return mapView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupGoogleMaps()
  }
  
  private func setupGoogleMaps() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(googleMap)
    googleMap.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    googleMap.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    googleMap.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    googleMap.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

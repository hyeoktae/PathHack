//
//  MapView.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import GoogleMaps

class MapView: UIView {
  private var googleMapView: GMSMapView = {
    let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 5)
    let gmsMapView = GMSMapView.map(withFrame: .zero, camera: camera)
    gmsMapView.mapType = .hybrid
    gmsMapView.translatesAutoresizingMaskIntoConstraints = false
    return gmsMapView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
//    googleMapView.mapType = .hybrid
//    googleMapView.mapType = .none
//    googleMapView.mapType = .normal
//    googleMapView.mapType = .satellite
//    googleMapView.mapType = .terrain
    setupGoogleMapView()
    
    let position = CLLocationCoordinate2D(latitude: 10, longitude: 10)
    let marker = GMSMarker(position: position)
    marker.title = "Hello World"
    marker.map = googleMapView
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  private func setupGoogleMapView() {
    self.addSubview(googleMapView)
    googleMapView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    googleMapView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    googleMapView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    googleMapView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

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
    let camera = GMSCameraPosition.camera(withLatitude: 35.154091, longitude: 129.0553, zoom: 18)
    let gmsMapView = GMSMapView.map(withFrame: .zero, camera: camera)
    gmsMapView.mapType = .normal
    gmsMapView.translatesAutoresizingMaskIntoConstraints = false
    return gmsMapView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    setupGoogleMapView()
    
    let position = CLLocationCoordinate2D(latitude: 35.154091, longitude: 129.0553)
    let marker = GMSMarker(position: position)
    marker.title = "Hello World"
    let view = GoogleMapPinView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    marker.iconView = view
    marker.map = googleMapView
    
    let position2 = CLLocationCoordinate2D(latitude: 35.233968, longitude: 129.080685)
    let marker2 = GMSMarker(position: position2)
    marker2.title = "Hello World"
    let view2 = GoogleMapPinView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    marker2.iconView = view2
    marker2.map = googleMapView
    
    let position3 = CLLocationCoordinate2D(latitude: 35.160321, longitude: 129.055334)
    let marker3 = GMSMarker(position: position3)
    marker3.title = "Hello World"
    let view3 = GoogleMapPinView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    marker3.iconView = view3
    marker3.map = googleMapView
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

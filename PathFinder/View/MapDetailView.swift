
//
//  MapDetailView.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import GoogleMaps

class MapDetailView: UIView {
  
  private var googleMapView = GMSMapView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    setupGoogleMapView()
  }
  
  func configureGoogleMapPosition(_ crimeData: CrimeModel) {
    let camera = GMSCameraPosition.camera(withLatitude: CLLocationDegrees(crimeData.postion[0]), longitude: CLLocationDegrees(crimeData.postion[1]), zoom: 18)
    let gmsMapView = GMSMapView.map(withFrame: .zero, camera: camera)
    self.googleMapView = gmsMapView
    
    let position = CLLocationCoordinate2D(latitude: CLLocationDegrees(crimeData.postion[0]), longitude: CLLocationDegrees(crimeData.postion[1]))
    let marker = GMSMarker(position: position)
    marker.iconView = GoogleMapPinView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
    marker.map = googleMapView
  }
  
  private func setupGoogleMapView() {
    googleMapView.translatesAutoresizingMaskIntoConstraints = false
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

//
//  MapView.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import GoogleMaps

protocol MapViewDelegate: class {
  func touchUpMarker(_ crimeData: CrimeModel, _ documentValue: String)
}

class MapView: UIView {
  var delegate: MapViewDelegate?
  
  private let shared = DataProvider.shared
  private var markerArr: [GMSMarker] = []
  
  private var googleMapView: GMSMapView = {
    let camera = GMSCameraPosition.camera(withLatitude: 35.154091, longitude: 129.0553, zoom: 18)
    let gmsMapView = GMSMapView.map(withFrame: .zero, camera: camera)
    gmsMapView.mapType = .normal
    gmsMapView.translatesAutoresizingMaskIntoConstraints = false
    return gmsMapView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    googleMapView.delegate = self
    setupGoogleMapView()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
  }
  
  func configureMapView(_ allCrimeData: [CrimeModel]) {
    for (idx, crime) in allCrimeData.enumerated() {
      let position = CLLocationCoordinate2D(latitude: CLLocationDegrees(crime.postion[0]), longitude: CLLocationDegrees(crime.postion[1]))
      let marker = GMSMarker(position: position)
      marker.iconView = GoogleMapPinView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
      marker.title = crime.type
      marker.snippet = String("포상금 : \(crime.reward[0])")
      marker.map = googleMapView
      marker.userData = idx
      markerArr.append(marker)
    }
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

extension MapView: GMSMapViewDelegate {
  func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
    guard let crimeDataIndex = marker.userData as? Int else { return false }
    delegate?.touchUpMarker(shared.crimeData[crimeDataIndex], shared.crimeDocument[crimeDataIndex])
    return true
  }
}

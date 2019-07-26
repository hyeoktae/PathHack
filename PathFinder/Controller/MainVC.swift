//
//  ViewController.swift
//  PathFinder
//
//  Created by Fury on 25/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import GoogleMaps

class MainVC: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    testFunc()
  }

  private func testFunc() {
    let camera = GMSCameraPosition.camera(withLatitude: 1.285, longitude: 103.848, zoom: 12)
    let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
    self.view = mapView
  }

}


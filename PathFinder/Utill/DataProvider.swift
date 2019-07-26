//
//  DataProvider.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

class DataProvider {
  static let shared = DataProvider()
  
  private init() {}
  
  var crimeData: [CrimeModel] = []
  var crimeDocument: [String] = []
}

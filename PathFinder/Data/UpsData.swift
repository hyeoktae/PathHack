//
//  UpsData.swift
//  PathFinder
//
//  Created by Fury on 25/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

struct CrimeModel {
  let postion: Position
  let location: String
  let type: String
  let date: String
  let state: String
  let caseNumber: String
  let districtPliceStation: PoliceStation
  let reward: Reward
}

struct Position {
  let latitude: CGFloat
  let longitude: CGFloat
}

struct PoliceStation {
  let name: String
  let number: String
}

struct Reward {
  let cash: Int
  let app: Int
  let penalty: Int
}

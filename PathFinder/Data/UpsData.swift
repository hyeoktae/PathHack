//
//  UpsData.swift
//  PathFinder
//
//  Created by Fury on 25/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation


struct CrimeModel {
  let location: String
  let type: String
  let date: String
  let state: String
  let caseNumber: String
  let districtPliceStation: PoliceStation
  let reward: Reward
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




let tempData: [CrimeModel] = [
  CrimeModel(
    location: "부산광역시 금정구 장전2동 부산대학로 63번 길2",
    type: "폭행",
    date: "2019.07.06",
    state: "진행중",
    caseNumber: "2019 가소 132호",
    districtPliceStation: PoliceStation(name: "부산금정경찰서", number: "051-512-0112"),
    reward: Reward(cash: 0, app: 0, penalty: 0)
  ),
  
  CrimeModel(
    location: "부산광역시 남구 대연동 황령대로 319번가길 110",
    type: "절도",
    date: "2019.02.17",
    state: "진행중",
    caseNumber: "2019 하확 283호",
    districtPliceStation: PoliceStation(name: "부산금정경찰서", number: "051-512-0112"),
    reward: Reward(cash: 0, app: 700, penalty: 0)
  ),
  
  CrimeModel(
    location: "부산광역시 부전1동 부전동 406-7번지 502호 라메르오피스텔",
    type: "방화",
    date: "2019.03.20",
    state: "진행중",
    caseNumber: "2019 감로 192호",
    districtPliceStation: PoliceStation(name: "부산금정경찰서", number: "051-512-0112"),
    reward: Reward(cash: 0, app: 700, penalty: 0)
  ),
  
  CrimeModel(
    location: "부산광역시 부산진구 부전동 375-12",
    type: "뺑소니",
    date: "2019.09.25",
    state: "진행중",
    caseNumber: "2019 타경 697호",
    districtPliceStation: PoliceStation(name: "부산금정경찰서", number: "051-512-0112"),
    reward: Reward(cash: 0, app: 700, penalty: 0)
  )
]

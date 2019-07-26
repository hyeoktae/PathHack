//
//  TassData.swift
//  PathFinder
//
//  Created by Fury on 25/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let resultData = try? newJSONDecoder().decode(ResultData.self, from: jsonData)


// MARK: - ResultData
struct ResultData: Codable {
  let info: Info
  let faces: [Face]
}

// MARK: - Face
struct Face: Codable {
  let celebrity: Celebrity
}

// MARK: - Celebrity
struct Celebrity: Codable {
  let value: String
  let confidence: Double
}

// MARK: - Info
struct Info: Codable {
  let size: Size
  let faceCount: Int
}

// MARK: - Size
struct Size: Codable {
  let width, height: Int
}

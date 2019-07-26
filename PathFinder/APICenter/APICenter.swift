//
//  APICenter.swift
//  PathFinder
//
//  Created by Fury on 25/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation
import Alamofire
import Firebase

class APICenter {
  static let shared = APICenter()
  
  let urlString = "https://openapi.naver.com/v1/vision/celebrity"
  
  let image1 = UIImage(named: "compare20")!.jpegData(compressionQuality: 0.8)
  let image2 = UIImage(named: "compare21")!.jpegData(compressionQuality: 0.8)
  let image3 = UIImage(named: "compare12")!.jpegData(compressionQuality: 0.8)
  let image4 = UIImage(named: "compare13")!.jpegData(compressionQuality: 0.8)
  
  let headers = [
    "X-Naver-Client-Id": "__KDBQ5UexI1fSNQO8Wb",
    "X-Naver-Client-Secret": "ptf7G_Poaa"
  ]
  
  func uploadImg() {
    Alamofire.upload(multipartFormData: { (MultipartFormData) in
      MultipartFormData.append(self.image2!, withName: "image", mimeType: "image/jpeg")
    }, to: urlString, method: .post, headers: headers) { (result) in
      switch result {
      case .success(let upload, _, _):
        upload.responseJSON {
          guard let data = $0.data else { return }
          guard let origin = try? JSONDecoder().decode(ResultData.self, from: data) else { return print("failtoParsing") }
          print("origin", origin.faces[0].celebrity.value)
        }
      case .failure(let err):
        print("Error", err)
      }
    }
  }
  
  func register() {
    let imageStr = UIImage(named: "compare20")!.jpegData(compressionQuality: 0.9)?.base64EncodedString()
    let db = Firestore.firestore()
    db.collection("image").document("num1").updateData(
      ["3":
        [
         "name": "로버트할리",
         "crime": "마약",
         "image": imageStr
        ]
      ]
    )
  }
  
}

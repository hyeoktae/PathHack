//
//  CompareFaceVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import Firebase

class CompareImageVC: UIViewController {
  
  let compareImageView = CompareImageView()
  
  var selectedImg: UIImage? = nil {
    willSet(new) {
      image = VisionImage(image: new!)
    }
  }
  
  var image: VisionImage?
  
  let labeler = Vision.vision().onDeviceImageLabeler()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    compareImageView.delegate = self
    view = compareImageView
    
    
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    APICenter.shared.register()
  }
  
  func makeLabel() {
    labeler.process(image!) { (labels, err) in
      guard err == nil, let labels = labels else { return }
      // blah
      for label in labels {
        let labelText = label.text
        let entityID = label.entityID
        let confidence = label.confidence
        print(labelText, entityID, confidence)
      }
    }
  }
  
}


extension CompareImageVC: UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    guard let selectedPhoto = info[.originalImage] as? UIImage else {
      return
    }
    dismiss(animated: true, completion: { [unowned self, selectedPhoto] in
      self.selectedImg = selectedPhoto
    })
  }
  
  func presentImagePicker() {
    let imagePickerActionSheet = UIAlertController(title: "Snap/Upload Image",
                                                   message: nil, preferredStyle: .actionSheet)
    
    if UIImagePickerController.isSourceTypeAvailable(.camera) {
      let cameraButton = UIAlertAction(title: "Take Photo",
                                       style: .default) { [unowned self] (alert) -> Void in
                                        let imagePicker = UIImagePickerController()
                                        imagePicker.delegate = self
                                        imagePicker.sourceType = .camera
                                        self.present(imagePicker, animated: true)
      }
      imagePickerActionSheet.addAction(cameraButton)
    }
    
    let libraryButton = UIAlertAction(title: "Choose Existing",
                                      style: .default) { [unowned self] (alert) -> Void in
                                        let imagePicker = UIImagePickerController()
                                        imagePicker.delegate = self
                                        imagePicker.sourceType = .photoLibrary
                                        self.present(imagePicker, animated: true)
    }
    imagePickerActionSheet.addAction(libraryButton)
    let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
    imagePickerActionSheet.addAction(cancelButton)
    present(imagePickerActionSheet, animated: true)
  }

  
}

extension CompareImageVC: CompareImageViewDelegate {
  func didTapLabeler() {
//    makeLabel()
  }
}

extension CompareImageVC: MainVCDelegate {
  func openCamera() {
    presentImagePicker()
  }
}

extension CompareImageVC: UINavigationControllerDelegate {
  
}

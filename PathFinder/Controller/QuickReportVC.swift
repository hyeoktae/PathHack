//
//  QuickReportVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import MessageUI

class QuickReportVC: UIViewController {
  
  private let quickReportView: QuickReportView = {
    let view = QuickReportView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    setupQuickReportView()
    quickReportView.delegate = self
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    startAnimations(isCancel: false)
  }
  
  private func startAnimations(isCancel: Bool) {
    if isCancel {
      UIView.animate(withDuration: 0.3) {
        self.quickReportView.topView.transform = CGAffineTransform(translationX: 0, y: -600)
      }
      
      UIView.animate(withDuration: 0.3, animations: {
        self.quickReportView.bottomView.transform = CGAffineTransform(translationX: 0, y: 600)
        self.quickReportView.policeCallButton.transform = CGAffineTransform(translationX: 0, y: 550)
      }) { (Bool) in
        self.dismiss(animated: false)
      }
    } else {
      UIView.animate(withDuration: 0.3) {
        self.quickReportView.topView.transform = CGAffineTransform(translationX: 0, y: self.view.frame.midY)
      }
      
      UIView.animate(withDuration: 0.3) {
        self.quickReportView.bottomView.transform = CGAffineTransform(translationX: 0, y: -250)
        self.quickReportView.policeCallButton.transform = CGAffineTransform(translationX: 0, y: -350)
      }
    }
  }
 
  private func setupQuickReportView() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(quickReportView)
    quickReportView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    quickReportView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    quickReportView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    quickReportView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension QuickReportVC: QuickReportViewDelegate {
  func touchUpAllButton(_ sender: UIButton) {
    switch sender.tag {
    case 0:
      if MFMessageComposeViewController.canSendText() {
        let recipients: [String] = ["01062658667"]
        let messageontroller = MFMessageComposeViewController()
        messageontroller.messageComposeDelegate = self
        messageontroller.recipients = recipients
        messageontroller.body = "텍스트"
        self.present(messageontroller, animated: true, completion: nil)
      }
    case 1:
      if MFMessageComposeViewController.canSendText() {
        let recipients: [String] = ["01062658667"]
        let messageontroller = MFMessageComposeViewController()
        messageontroller.messageComposeDelegate = self
        messageontroller.recipients = recipients
        messageontroller.body = "텍스트"
        self.present(messageontroller, animated: true, completion: nil)
      }
    case 2:
      if MFMessageComposeViewController.canSendText() {
        let recipients: [String] = ["01062658667"]
        let messageontroller = MFMessageComposeViewController()
        messageontroller.messageComposeDelegate = self
        messageontroller.recipients = recipients
        messageontroller.body = "텍스트"
        self.present(messageontroller, animated: true, completion: nil)
      }
    case 3:
      if MFMessageComposeViewController.canSendText() {
        let recipients: [String] = ["01062658667"]
        let messageontroller = MFMessageComposeViewController()
        messageontroller.messageComposeDelegate = self
        messageontroller.recipients = recipients
        messageontroller.body = "텍스트"
        self.present(messageontroller, animated: true, completion: nil)
      }
    default:
      break
    }
  }
  
  func touchUpCancelButton() {
    startAnimations(isCancel: true)
  }
}

extension QuickReportVC: MFMessageComposeViewControllerDelegate {
  func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    controller.dismiss(animated: true, completion: nil)
  }
}

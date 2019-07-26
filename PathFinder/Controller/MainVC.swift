//
//  ViewController.swift
//  PathFinder
//
//  Created by Fury on 25/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit
import GoogleMaps

protocol MainVCDelegate: class {
  func openCamera()
}

class MainVC: UIViewController {
  
  weak var delegate: MainVCDelegate?
  
  var mapVC: MapVC?
  var compareImageVC: CompareImageVC?
  var quickReportVC: QuickReportVC?
  var rewordStoreVC: RewordStoreVC?
  var myPageVC: MyPageVC?
  
  var vcList = [UIViewController]()
  var prevIndex: Int?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    mapVC = MapVC()
    compareImageVC = CompareImageVC()
    quickReportVC = QuickReportVC()
    rewordStoreVC = RewordStoreVC()
    myPageVC = MyPageVC()
    
    self.delegate = compareImageVC
    
    makeViewList()
    linkTargetAction()
  }
  
  // 뷰가 로딩이 다 되고 난 뒤 기본 뷰를 셋팅한다.
  override func viewDidAppear(_ animated: Bool) {
    if prevIndex == nil {
      prevIndex = 0
      moveView(0)
    }
  }
  
  @objc func linkAction(_ sender: UIButton) {
    checkView()
    prevIndex = sender.tag
    moveView(sender.tag)
    if sender.tag == 1 {
      delegate?.openCamera()
    }
  }
  
  private func checkView() {
    guard let prevSelectedIndex = prevIndex else { return }
    vcList[prevSelectedIndex].willMove(toParent: nil)
    vcList[prevSelectedIndex].view.removeFromSuperview()
    vcList[prevSelectedIndex].removeFromParent()
  }
  
  func moveView(_ index: Int) {
    guard let targetView = view as? CustomTabbarView else { return }
    
    addChild(vcList[index])
    targetView.contentView.addSubview(vcList[index].view)
    vcList[index].view.frame = targetView.contentView.bounds
    vcList[index].didMove(toParent: self)
  }
  
  
  // 가운데 동그라미 버튼 클릭 시
  @objc func moveWriteView() {
    
    let quickReportVC = QuickReportVC()
    quickReportVC.modalPresentationStyle = .overCurrentContext
    present(quickReportVC, animated: true)
  }
  
  ///각 탭바의 아이템들을 액션에 연결한다.
  func linkTargetAction() {
    guard let targetView = view as? CustomTabbarView else {
      return
    }
    
    targetView.leftStack.firstButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
    targetView.leftStack.secondButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
    targetView.rightStack.firstButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
    targetView.rightStack.secondButton.addTarget(self, action: #selector(linkAction), for: .touchUpInside)
    
    targetView.centerButton.addTarget(self, action: #selector(moveWriteView), for: .touchUpInside)
  }
  
  func makeViewList() {
    guard let views = [mapVC, compareImageVC, quickReportVC, myPageVC, rewordStoreVC] as? [UIViewController] else {
      return
    }
    
    vcList = views
  }
  
  override func loadView() {
    view = CustomTabbarView()
  }
}


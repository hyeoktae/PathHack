//
//  RewordStoreVC.swift
//  PathFinder
//
//  Created by Fury on 26/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

struct Store {
  let commpany: String
  let detail: String
  let appPoint: Int
}

class RewordStoreVC: UIViewController {
  
  private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
  private var cellWidth: CGFloat = 0
  private var cellHeight: CGFloat = 0
  private let pageControl = UIPageControl()
  
  var data = [
    Store(commpany: "배스킨라빈스", detail: "닐라닐라 바닐라", appPoint: 100),
    Store(commpany: "배스킨라빈스", detail: "닐라닐라 바닐라", appPoint: 100),
    Store(commpany: "배스킨라빈스", detail: "닐라닐라 바닐라", appPoint: 100),
    Store(commpany: "배스킨라빈스", detail: "닐라닐라 바닐라", appPoint: 100),
    Store(commpany: "배스킨라빈스", detail: "닐라닐라 바닐라", appPoint: 100),
  ]
  
  private var groupCount = 0 {
    willSet {
      pageControl.currentPage = newValue
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationSet()
    configure()
    autoLayout()
  }
  
  private var layoutState = true
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    if layoutState {
      let collectionViewWidth = view.frame.width - (view.safeAreaInsets.right + view.safeAreaInsets.left)
      let cellectionViewHeight = view.frame.height - (view.safeAreaInsets.top + view.safeAreaInsets.bottom + 50)
      
      cellWidth = collectionViewWidth - (Standard.space * 2)
      cellHeight = cellectionViewHeight - (Standard.space * 2)
      
      let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
      layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
      layout.minimumLineSpacing = Standard.minimumLineSpacing
      layout.scrollDirection = .horizontal
      collectionView.contentInset = UIEdgeInsets(top: Standard.space, left: Standard.space, bottom: Standard.space, right: Standard.space)
    }
    layoutState = false
  }
  
  private func navigationSet() {
    navigationItem.title = "Store"
  }
  
  
  private func configure() {
    view.backgroundColor = #colorLiteral(red: 0.6941176471, green: 0.8666666667, blue: 0.8509803922, alpha: 1)
    
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .clear
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
    collectionView.register(RewoadCell.self, forCellWithReuseIdentifier: RewoadCell.identifier)
    view.addSubview(collectionView)
    
    pageControl.currentPage = 0
    pageControl.currentPageIndicatorTintColor = .darkGray
    pageControl.pageIndicatorTintColor = UIColor.darkGray.withAlphaComponent(0.2)
    pageControl.numberOfPages = data.count
    view.addSubview(pageControl)
  }
  
  private struct Standard {
    static let space: CGFloat = 40
    static let minimumLineSpacing: CGFloat = 20
    
    static let sliderHeight: CGFloat = 60
  }
  
  private func autoLayout() {
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    
    pageControl.translatesAutoresizingMaskIntoConstraints = false
    pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor).isActive = true
    pageControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    pageControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    pageControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
    pageControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
  }
  
  func alertAction(tilte: String?, message: String?) {
    let alert = UIAlertController(title: tilte, message: message, preferredStyle: .alert)
    let cancel = UIAlertAction(title: "cancel", style: .cancel) { (action) in
      
    }
    alert.addAction(cancel)
    present(alert, animated: true)
  }
}


extension RewordStoreVC: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RewoadCell.identifier, for: indexPath) as! RewoadCell
    
    cell.setting(data: data[indexPath.row])
    
    return cell
  }
}

extension RewordStoreVC: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    // item의 사이즈와 item 간의 간격 사이즈를 구해서 하나의 item 크기로 설정.
    let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
    
    // targetContentOff을 이용하여 x좌표가 얼마나 이동했는지 확인
    // 이동한 x좌표 값과 item의 크기를 비교하여 몇 페이징이 될 것인지 값 설정
    var offset = targetContentOffset.pointee
    let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
    var roundedIndex = round(index)
    
    
    // scrollView, targetContentOffset의 좌표 값으로 스크롤 방향을 알 수 있다.
    // index를 반올림하여 사용하면 item의 절반 사이즈만큼 스크롤을 해야 페이징이 된다.
    // 스크로로 방향을 체크하여 올림,내림을 사용하면 좀 더 자연스러운 페이징 효과를 낼 수 있다.
    if scrollView.contentOffset.x > targetContentOffset.pointee.x {
      roundedIndex = floor(index)
    } else {
      roundedIndex = ceil(index)
    }
    groupCount = Int(roundedIndex)
    // 위 코드를 통해 페이징 될 좌표값을 targetContentOffset에 대입하면 된다.
    offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: -scrollView.contentInset.top)
    targetContentOffset.pointee = offset
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    alertAction(tilte: "포인트 부족", message: "더 많은 신고 부탁드립니다.")
  }
}

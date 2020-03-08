//
//  SwipingController.swift
//  Autolayout
//
//  Created by Jamario Davis on 4/24/19.
//  Copyright © 2019 KAYCAM. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    let pages = [ Page(imageName: "diet", headerText: "Start now", bodytext: "Join us today and start a healthy lifestyle!"),
        Page(imageName: "lunch-box", headerText: "Meal plan", bodytext: "Create weekly meal plans"),
         Page(imageName: "smoothies", headerText: "Weight tracker", bodytext: "Weight loss tracker to keep track of your weight loss goals"),
          Page(imageName: "salad", headerText: "Member rewards", bodytext: "VIP member discounts for paid subcribers")
    ]
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handlePrev), for: .touchUpInside)
        return button
    }()
    @objc private func handlePrev() {
        let nextIndex = max(pageControl.currentPage - 1,  0)
        pageControl.currentPage = nextIndex
        let indexPath = IndexPath(item: nextIndex, section: 0); collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        return
    }
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    @objc private func handleNext() {
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        pageControl.currentPage = nextIndex 
        let indexPath = IndexPath(item: nextIndex, section: 0); collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 247/255, green: 147/255, blue: 30/255, alpha: 1)
        return pc
    }()
    fileprivate func setupBottomControls() {
        //view.addSubview(previousButton)
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        // Use this to prevent using .isActived
        NSLayoutConstraint.activate([
            //Layout guide for safe area
            //previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width) 
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBottomControls()
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
    }
}



























































































































































































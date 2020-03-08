//
//  ViewController.swift
//  Autolayout
//
//  Created by Jamario Davis on 4/21/19.
//  Copyright © 2019 KAYCAM. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 137/255, green: 201/255, blue: 71/255, alpha: 1)
}
class ViewController: UIViewController {
    let dietImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "diet"))
        // this enables autolayout for our imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let desriptionTextView: UITextView = {
        let textView = UITextView()
        // Code used to change text style and size
        let attributedText = NSMutableAttributedString(string: "Join us today and start a healthy lifestyle!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 24)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready to start eating healthy? Don't wait any longer! We hope to see you soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false 
        return textView
    }()
// make sure you apply the correct encapsulation principles in your classes
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PREV", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("NEXT", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        return button
    }()
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 247/255, green: 147/255, blue: 30/255, alpha: 1)
        return pc
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(desriptionTextView)
        setupBottomControls()
        setupLayout()
    }
    fileprivate func setupBottomControls() {
//view.addSubview(previousButton)
        let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        NSLayoutConstraint.activate([
            //Layout guide for safe area
            //previousButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    private func setupLayout() {
// Layout for containerview
        let topImageContainerView = UIView()
        //topImageContainerView.backgroundColor = .blue
        view.addSubview(topImageContainerView)
//enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
// Code for top container in UIView. Also use leading and trailing instead of using left to right due to Arabic language(Arabic reads from right to left).
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.addSubview(dietImageView)
        dietImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        dietImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
// Landscape view
        dietImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        desriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        // Used to add side padding on the text.
        desriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        desriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        desriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
}




























































































































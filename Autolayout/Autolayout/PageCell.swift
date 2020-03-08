//
//  PageCell.swift
//  Autolayout
//
//  Created by Jamario Davis on 4/24/19.
//  Copyright © 2019 KAYCAM. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            attributedText.append(NSAttributedString(string: "\n\n\n\(unwrappedPage.bodytext)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
            desriptionTextView.attributedText = attributedText
            desriptionTextView.textAlignment = .center 
        }
    }
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "diet"))
       imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let desriptionTextView: UITextView = {
        let textView = UITextView()
        // Code used to change text style and size
        let attributedText = NSMutableAttributedString(string: "Join us today and start a healthy lifestyle!", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready to start eating healthy? Don't wait any longer! We hope to see you soon.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    private func setupLayout() {
        // Layout for containerview
        let topImageContainerView = UIView()
        //topImageContainerView.backgroundColor = .blue
        addSubview(topImageContainerView)
        //enable auto layout
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        // Code for top container in UIView. Also use leading and trailing instead of using left to right due to Arabic language(Arabic reads from right to left).
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.addSubview(bearImageView)
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        // Landscape view
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        addSubview(desriptionTextView)
        desriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        // Used to add side padding on the text.
        desriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        desriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        desriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
































































































































































































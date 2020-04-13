//
//  ViewController.swift
//  Onboarding
//
//  Created by Rani Triani Gustia on 13/04/20.
//  Copyright © 2020 Rani Triani Gustia. All rights reserved.
//

import UIKit

extension UIColor {
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        let profile = UIImage(named: "onboard")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        imageView.image = profile
        
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
       let textView = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Join us today in our fun lunch!", attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for loads and loads for fun? Don't wait any longer! We hope to see you in our event today.", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    private let previousButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("PREV", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
           button.setTitleColor(.gray, for: .normal)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
       
    private let nextButton: UIButton = {
           let button = UIButton(type: .system)
           button.setTitle("NEXT", for: .normal)
           button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
           button.setTitleColor(.mainPink, for: .normal)
           button.translatesAutoresizingMaskIntoConstraints = false
           return button
       }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = .gray
        
        return pc
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(profileImageView)
        view.addSubview(descriptionTextView)
        
        setupBottomControls()
        setupLayout()
    }
    
    fileprivate func setupBottomControls(){
            
            let yellowView = UIView()
            yellowView.backgroundColor = .yellow
            
            let greenView = UIView()
            greenView.backgroundColor = .green
            
            let blueView = UIView()
            blueView.backgroundColor = .blue
            let bottomControlsStackView = UIStackView(arrangedSubviews: [previousButton, pageControl, nextButton])
            
            bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
            bottomControlsStackView.distribution = .fillEqually
            
            view.addSubview(bottomControlsStackView)
            
            NSLayoutConstraint.activate([
                bottomControlsStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                bottomControlsStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                bottomControlsStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
    private func setupLayout(){
        let topImageContainerView = UIView()
        view.addSubview(topImageContainerView)
        
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false

        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.addSubview(profileImageView)
        profileImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        profileImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 200)
        
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        profileImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        profileImageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

}


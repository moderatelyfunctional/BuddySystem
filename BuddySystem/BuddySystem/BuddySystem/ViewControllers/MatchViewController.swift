//
//  MatchViewController.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class MatchViewController: UIViewController {
    
    let appTitle = BLabel(text: "its a match!", font: .systemFont(ofSize: 48))
    
    let susan = BImageView(image: UIImage(named: "susan"))
    let amir = BImageView(image: UIImage(named: "amir"))
    
    let susanText = BLabel(text: "susan", font: .systemFont(ofSize: 20))
    let amirText = BLabel(text: "amir", font: .systemFont(ofSize: 20))
    
    let callButton = CircleButton(name: "phone")
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.appTitle)
        self.view.addSubview(self.susan)
        self.view.addSubview(self.amir)
        self.view.addSubview(self.susanText)
        self.view.addSubview(self.amirText)
        self.view.addSubview(self.callButton)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.appTitle, side: .top, padding: 80))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.appTitle, side: .left, padding: 40))
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.appTitle, lowerView: self.susan, spacing: 100))
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.appTitle, lowerView: self.amir, spacing: 100))

        self.view.addConstraint(NSLayoutConstraint(item: self.susan, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 0.6, constant: 1.0))
        self.view.addConstraint(NSLayoutConstraint(item: self.amir, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.4, constant: 1.0))

        self.view.addConstraint(BConstraint.fillXConstraints(view: self.amir, widthRatio: 0.3))
        self.view.addConstraint(BConstraint.fillXConstraints(view: self.susan, widthRatio: 0.3))
        
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.amir, lowerView: self.amirText, spacing: 35))
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.susan, lowerView: self.susanText, spacing: 35))
        
        self.view.addConstraint(BConstraint.equalConstraint(firstView: self.susan, secondView: self.susanText, attribute: .centerX))
        self.view.addConstraint(BConstraint.equalConstraint(firstView: self.amir, secondView: self.amirText, attribute: .centerX))

        self.view.addConstraint(BConstraint.constantConstraint(view: self.callButton, attribute: .width, value: Constants.callCircle))
        self.view.addConstraint(BConstraint.constantConstraint(view: self.callButton, attribute: .height, value: Constants.callCircle))
        
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.amirText, lowerView: self.callButton, spacing: 120))
        self.view.addConstraint(BConstraint.horizontalAlignConstraint(firstView: self.callButton, secondView: self.view))
        
    }
    
}


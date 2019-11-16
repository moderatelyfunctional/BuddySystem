//
//  LoginViewController.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    let appTitle = BTitle()
    
    let loginButton = BButton(color: Constants.green, text: "Login")
    let signupButton = BButton(color: Constants.green, text: "Sign Up")
    let background = BImageView(image: UIImage(named: "wavy"))
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        self.view.addSubview(self.appTitle)
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.signupButton)
        self.view.insertSubview(self.background, at: 0)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraint(BConstraint.equalConstraint(firstView: self.appTitle, secondView: self.view, attribute: .centerX))
        self.view.addConstraint(NSLayoutConstraint(item: self.appTitle, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.7, constant: 0))

        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.background, sides: [.left, .right, .bottom], padding: 0))
        self.view.addConstraint(BConstraint.fillXConstraints(view: self.loginButton, widthRatio: 0.7))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.loginButton, heightRatio: 0.06))
        self.view.addConstraint(BConstraint.fillXConstraints(view: self.signupButton, widthRatio: 0.7))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.signupButton, heightRatio: 0.06))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.loginButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.15, constant: 0))
        self.view.addConstraint(BConstraint.equalConstraint(firstView: self.loginButton, secondView: self.view, attribute: .centerX))
        
        self.view.addConstraint(BConstraint.equalConstraint(firstView: self.signupButton, secondView: self.view, attribute: .centerX))
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.loginButton, lowerView: self.signupButton, spacing: 40))

    }
    
}

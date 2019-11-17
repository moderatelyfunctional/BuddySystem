//
//  WavyLogin.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class WavyLogin: UIView {
    
    let background = DismissWavy()
    let email = BLabel(text: "what's your email?", font: .systemFont(ofSize: 32))
    let emailField = BTextField(placeholder: "susangreen@gmail.com")
    
    let password = BLabel(text: "what's your password?", font: .systemFont(ofSize: 32))
    let passwordField = BTextField(placeholder: "password")
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
               
        self.isUserInteractionEnabled = true
        
        self.email.textColor = UIColor.white
        self.password.textColor = UIColor.white
        
        self.addSubview(self.background)
        self.addSubview(self.email)
        self.addSubview(self.emailField)
        self.addSubview(self.password)
        self.addSubview(self.passwordField)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.background, sides: [.left, .top, .right, .bottom], padding: 0))
        
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.email, sides: [.left, .right], padding: 40))
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.email, side: .top, padding: 80))
        
        self.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.email, lowerView: self.emailField, spacing: 20))
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.emailField, sides: [.left, .right], padding: 40))
        self.addConstraint(BConstraint.constantConstraint(view: self.emailField, attribute: .height, value: UIScreen.main.bounds.height * 0.05))
        
        self.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.emailField, lowerView: self.password, spacing: 50))
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.password, sides: [.left, .right], padding: 40))
        self.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.password, lowerView: self.passwordField, spacing: 20))
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.passwordField, sides: [.left, .right], padding: 40))
        self.addConstraint(BConstraint.constantConstraint(view: self.passwordField, attribute: .height, value: UIScreen.main.bounds.height * 0.05))
    }
    
}

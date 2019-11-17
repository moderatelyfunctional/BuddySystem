//
//  WavyModal.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class WavyModal: UIView {
    
    let login = WavyLogin()
    let submit = BButton(color: Constants.green, text: "Submit")
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = Constants.orange
        
        self.layer.cornerRadius = 40
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.addSubview(self.login)
        self.addSubview(self.submit)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.login, sides: [.left, .top, .right, .bottom], padding: 0))
        
        self.addConstraint(BConstraint.equalConstraint(firstView: self.submit, secondView: self, attribute: .centerX))
        self.addConstraint(BConstraint.fillXConstraints(view: self.submit, widthRatio: 0.7))
        self.addConstraint(BConstraint.fillYConstraints(view: self.submit, heightRatio: 0.075))
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.submit, side: .bottom, padding: 80))
    }
    
    func showLogin() {
        
    }
    
}

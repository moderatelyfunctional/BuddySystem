//
//  CircleImageView.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/17/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class CircleImageView: UIView {
    
    var toggle = true
    let imageView:BImageView
    
    init(name: String) {
        self.imageView = BImageView(image: UIImage(named: name))
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = (10 + Constants.smileyCircle) / 2
        
        self.addSubview(self.imageView)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraint(BConstraint.constantConstraint(view: self.imageView, attribute: .width, value: Constants.smileyCircle))
        self.addConstraint(BConstraint.constantConstraint(view: self.imageView, attribute: .height, value: Constants.smileyCircle))
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.imageView, sides: [.left, .top, .right, .bottom], padding: 5))
    }
    
    func toggleColor() {
        self.backgroundColor = self.toggle ? Constants.yellow : UIColor.white
        self.toggle = !self.toggle
    }
    
}

//
//  PillComplete.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/17/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class PillComplete: UIView {
    
    let circle = CircleImageView(name: "smile")
    let taken = BLabel(text: "Taken!", font: .systemFont(ofSize: 18))
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.taken.textColor = UIColor.white
        
        self.addSubview(self.circle)
        self.addSubview(self.taken)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.circle, side: .left, padding: 0))
        self.addConstraint(BConstraint.horizontalSpacingConstraint(leftView: self.circle, rightView: self.taken, spacing: 5))
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.taken, side: .right, padding: 0))
        
        
        self.addConstraint(BConstraint.verticalAlignConstraint(firstView: self.taken, secondView: self))
        self.addConstraint(BConstraint.verticalAlignConstraint(firstView: self.circle, secondView: self))
    }
    
}

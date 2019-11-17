//
//  Pill.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/17/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class Pill: UIView {
    
    let pillInstructions:PIllInstructions
    let takenAfter:BLabel
    let pillComplete = PillComplete()
    
    init(pillText: String, pillCount: Int, takenAfter: String) {
        self.pillInstructions = PIllInstructions(pillText: pillText, pillCount: pillCount)
        
        self.takenAfter = BLabel(text: takenAfter, font: .systemFont(ofSize: 16))
        
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.isUserInteractionEnabled = true
        self.takenAfter.textColor = UIColor.white
        
        self.backgroundColor = Constants.green
        self.layer.cornerRadius = 20
                
        self.addSubview(self.pillInstructions)
        self.addSubview(self.takenAfter)
        self.addSubview(self.pillComplete)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.pillInstructions, side: .left, padding: 10))
        self.addConstraint(BConstraint.verticalAlignConstraint(firstView: self.pillInstructions, secondView: self))
        
        self.addConstraint(BConstraint.fillXConstraints(view: self.pillInstructions, widthRatio: 0.4))
        
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.takenAfter, sides: [.right, .top], padding: 20))

        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.pillComplete, side: .right, padding: 0))
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.pillComplete, side: .bottom, padding: 0))
        self.addConstraint(BConstraint.fillXConstraints(view: self.pillComplete, widthRatio: 0.36))
        self.addConstraint(BConstraint.fillYConstraints(view: self.pillComplete, heightRatio: 0.4))
    }
    
}

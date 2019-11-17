//
//  PillInstructions.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/17/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class PIllInstructions: UIView {
    
    let pillText:BLabel
    let pillCount:PillCount
    
    init(pillText: String, pillCount: Int) {
        self.pillText = BLabel(text: pillText, font: .systemFont(ofSize: 24))
        self.pillCount = PillCount(pillCount: pillCount)
        
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.pillText.textColor = UIColor.white
        
        self.addSubview(self.pillText)
        self.addSubview(self.pillCount)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.pillText, sides: [.top, .right], padding: 0))
        
        self.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.pillText, lowerView: self.pillCount, spacing: -5))
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.pillCount, sides: [.bottom, .right], padding: 0))
    }
    
}

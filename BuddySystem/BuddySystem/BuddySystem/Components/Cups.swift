//
//  Cups.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class Cups: UIView {
    
    let cupsText = BLabel(text: "cups per\nhour:", font: .systemFont(ofSize: 20))
    let cupsCounter = CupsCounter()
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.cupsText.textColor = UIColor.white
                
        self.backgroundColor = Constants.green
        self.layer.cornerRadius = 20
        
        self.addSubview(self.cupsText)
        self.addSubview(self.cupsCounter)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.cupsText, side: .left, padding: 50))
        self.addConstraint(BConstraint.verticalAlignConstraint(firstView: self.cupsText, secondView: self))
        
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.cupsCounter, side: .right, padding: 50))
        self.addConstraint(BConstraint.fillXConstraints(view: self.cupsCounter, widthRatio: 0.2))
        self.addConstraint(BConstraint.fillYConstraints(view: self.cupsCounter, heightRatio: 0.6))
        self.addConstraint(BConstraint.verticalAlignConstraint(firstView: self.cupsCounter, secondView: self))
        
    }
    
}

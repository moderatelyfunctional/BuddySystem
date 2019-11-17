//
//  PillCount.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/17/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class PillCount: UIView {

    var circles:[PillCircle] = []
    let pillText:BLabel
    
    init(pillCount: Int) {
        for _ in 1...pillCount {
            self.circles.append(PillCircle())
        }
        self.pillText = BLabel(text: "\(pillCount) pills", font: .systemFont(ofSize: 18))
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false

        self.pillText.textColor = UIColor.white
        
        for circle in self.circles {
            self.addSubview(circle)
        }
        self.addSubview(self.pillText)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        var priorCircle = self.circles.first!
        for (i, circle) in self.circles.enumerated() {
            self.addConstraint(BConstraint.verticalAlignConstraint(firstView: circle, secondView: self))
            self.addConstraint(BConstraint.constantConstraint(view: circle, attribute: .height, value: Constants.pillCircle))
            self.addConstraint(BConstraint.constantConstraint(view: circle, attribute: .width, value: Constants.pillCircle))

            if (i == 0) {
                self.addConstraint(BConstraint.paddingPositionConstraint(view: circle, side: .left, padding: 5))
                continue
            }
            self.addConstraint(BConstraint.horizontalSpacingConstraint(leftView: priorCircle, rightView: circle, spacing: 4))
            priorCircle = circle
        }
        self.addConstraint(BConstraint.horizontalSpacingConstraint(leftView: priorCircle, rightView: pillText, spacing: 10))
        self.addConstraint(BConstraint.verticalAlignConstraint(firstView: self.pillText, secondView: self))
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.pillText, sides: [.top, .right, .bottom], padding: 5))
    }
    
}

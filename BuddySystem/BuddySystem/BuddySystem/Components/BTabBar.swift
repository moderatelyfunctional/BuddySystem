//
//  BTabBar.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class BTabBar: UIView {
    
    let imgs = [
        BImageView(image: UIImage(named: "tab_pencil")),
        BImageView(image: UIImage(named: "tab_alarm")),
        BImageView(image: UIImage(named: "tab_walk")),
        BImageView(image: UIImage(named: "tab_step")),
    ]
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = Constants.orange
        self.layer.cornerRadius = 32
        
        for img in imgs {
            img.contentMode = .scaleAspectFit
            self.addSubview(img)
        }
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        for (i, img) in imgs.enumerated() {
            let leftPadding = (0.075 + CGFloat(i) * 0.25) * UIScreen.main.bounds.width
            self.addConstraint(BConstraint.paddingPositionConstraint(view: img, side: .left, padding: leftPadding))
            self.addConstraint(BConstraint.fillXConstraints(view: img, widthRatio: 0.1))
            self.addConstraint(BConstraint.verticalAlignConstraint(firstView: img, secondView: self))
        }
        
    }
    
}

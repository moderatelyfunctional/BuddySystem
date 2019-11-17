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
        BImageView(image: UIImage(named: "tab_pencil")!.withRenderingMode(.alwaysTemplate)),
        BImageView(image: UIImage(named: "tab_alarm")!.withRenderingMode(.alwaysTemplate)),
        BImageView(image: UIImage(named: "tab_walk")!.withRenderingMode(.alwaysTemplate)),
        BImageView(image: UIImage(named: "tab_step")!.withRenderingMode(.alwaysTemplate)),
    ]
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.isUserInteractionEnabled = true
        
        self.backgroundColor = Constants.orange
        self.layer.cornerRadius = 32
        
        for img in imgs {
            img.tintColor = UIColor.white
            img.isUserInteractionEnabled = true
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
    
    func selectIndex(index: Int) {
        for (i, img) in self.imgs.enumerated() {
            img.tintColor = i == index ? UIColor.darkText : UIColor.white
        }
    }
    
}

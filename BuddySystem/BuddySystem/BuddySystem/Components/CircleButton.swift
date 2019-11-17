//
//  CircleButton.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/17/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class CircleButton: UIView {
    
    let img:BImageView
    
    init(name: String) {
        self.img = BImageView(image: UIImage(named: name))
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = Constants.peach
        self.layer.cornerRadius = Constants.callCircle / 2
        
        self.addSubview(self.img)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraints(BConstraint.paddingPositionConstraints(view: self.img, sides: [.left, .top, .right, .bottom], padding: 10))
    }
    
}

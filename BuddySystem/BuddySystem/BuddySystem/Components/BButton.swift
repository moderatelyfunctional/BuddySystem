//
//  BButton.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class BButton: UIButton {
    
    let baseColor:UIColor
    
    init(color: UIColor, text: String) {
        self.baseColor = color
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.backgroundColor = color
        
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? self.baseColor.darker(by: 20) : self.baseColor
        }
    }

}



//
//  BImageView.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class BImageView: UIImageView {
        
    override init(image: UIImage?) {
        super.init(image: image)
        
        self.contentMode = .scaleAspectFill
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

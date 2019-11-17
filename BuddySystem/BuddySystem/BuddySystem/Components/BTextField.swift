//
//  BTextField.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class BTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.placeholder = placeholder
        self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.darkText])
        
        self.autocorrectionType = .no
        
        self.backgroundColor = UIColor.white
        self.textColor = UIColor.black
        self.layer.cornerRadius = UIScreen.main.bounds.height * 0.05 / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15, dy: 4)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 15, dy: 4)
    }
    
}

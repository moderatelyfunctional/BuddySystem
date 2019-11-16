//
//  BTitle.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class BTitle: UILabel {
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let six = NSAttributedString(string: "6", attributes: [
            .foregroundColor: Constants.red,
            .font: UIFont.monospacedSystemFont(ofSize: 100, weight: .regular)
        ])
        let uddy = NSAttributedString(string: "uddy  ", attributes: [
            .font: UIFont.systemFont(ofSize: 40, weight: .regular)
        ])
        let five = NSAttributedString(string: "5", attributes: [
            .foregroundColor: Constants.red,
            .font: UIFont.monospacedSystemFont(ofSize: 100, weight: .regular)
        ])
        let ystem = NSAttributedString(string: "ystem", attributes: [
            .font: UIFont.systemFont(ofSize: 40, weight: .regular)
        ])

        let completeString = NSMutableAttributedString()
        completeString.append(six)
        completeString.append(uddy)
        completeString.append(five)
        completeString.append(ystem)
        
        self.attributedText = completeString
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

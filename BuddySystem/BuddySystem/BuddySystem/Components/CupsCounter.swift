//
//  CupsCounter.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class CupsCounter: UIView {

    var counter = 1
    let cupText = BLabel(text: "1", font: .systemFont(ofSize: 24))
    
    let upImg = BImageView(image: UIImage(named: "up"))
    let downImg = BImageView(image: UIImage(named: "down"))
    
    init() {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.white
                
        let incRecognizer = UITapGestureRecognizer(target: self, action: #selector(incCounter))
        let decRecognizer = UITapGestureRecognizer(target: self, action: #selector(decCounter))
        self.upImg.addGestureRecognizer(incRecognizer)
        self.downImg.addGestureRecognizer(decRecognizer)

        self.upImg.isUserInteractionEnabled = true
        self.downImg.isUserInteractionEnabled = true
        
        self.upImg.contentMode = .scaleAspectFit
        self.downImg.contentMode = .scaleAspectFit

        self.addSubview(self.cupText)
        self.addSubview(self.upImg)
        self.addSubview(self.downImg)
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addConstraints() {
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.cupText, side: .left, padding: 10))
        self.addConstraint(BConstraint.verticalAlignConstraint(firstView: self.cupText, secondView: self))
        
        self.addConstraint(NSLayoutConstraint(item: self.upImg, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 0.75, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: self.downImg, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.25, constant: 0.0))

        self.addConstraint(BConstraint.fillXConstraints(view: self.upImg, widthRatio: 0.175))
        self.addConstraint(BConstraint.fillYConstraints(view: self.upImg, heightRatio: 0.2))
        self.addConstraint(BConstraint.fillXConstraints(view: self.downImg, widthRatio: 0.175))
        self.addConstraint(BConstraint.fillYConstraints(view: self.downImg, heightRatio: 0.2))
        
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.upImg, side: .right, padding: 10))
        self.addConstraint(BConstraint.paddingPositionConstraint(view: self.downImg, side: .right, padding: 10))

    }
    
    @objc func incCounter() {
        self.counter += 1
        self.counter = min(self.counter, 9)
        self.cupText.text = "\(self.counter)"
    }
    
    @objc func decCounter() {
        self.counter -= 1
        self.counter = max(self.counter, 1)
        self.cupText.text = "\(self.counter)"
    }
    
}


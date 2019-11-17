//
//  ProgressCircle.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/17/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class ProgressCircle: UIView {
    
    var percentage:CGFloat = 17.0
    
    let text = UILabel(frame: CGRect(
        x: Constants.progressCircle * 0.65,
        y: Constants.progressCircle * 0.65,
        width: 80,
        height: 60))
    let border = UIImageView(image: UIImage(named: "circle_border"))
    var progressCurve = CAShapeLayer()
    
    init() {
        super.init(frame: CGRect(
            x: 0,
            y: 0,
            width: Constants.progressCircle,
            height: Constants.progressCircle))

        self.border.frame = CGRect(
            x: 0,
            y: 0,
            width: Constants.progressCircle,
            height: Constants.progressCircle)
        
        self.progressCurve.fillColor = Constants.green.cgColor

        self.layer.cornerRadius = Constants.progressCircle / 2
        self.clipsToBounds = true
        
        self.addSubview(self.border)
        self.addSubview(self.text)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createPath() -> UIBezierPath {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: Constants.progressCircle, y: Constants.progressCircle))

        if self.percentage <= 50.0 {
            let newXY = Constants.progressCircle * (1.0 - (percentage / 50.0))

            let left = CGPoint(x: newXY, y: Constants.progressCircle)
            let top = CGPoint(x: Constants.progressCircle, y: newXY)
            path.addLine(to: left)
            path.addLine(to: top)
        } else {
            let newXY = Constants.progressCircle * (1.0 - (percentage / 100.0))
            
            let left_one = CGPoint(x: 0, y: newXY)
            let left_two = CGPoint(x: 0, y: Constants.progressCircle)
            let top_one = CGPoint(x: newXY, y: 0)
            let top_two = CGPoint(x: Constants.progressCircle, y: 0)
            path.addLine(to: left_two)
            path.addLine(to: left_one)
            path.addLine(to: top_one)
            path.addLine(to: top_two)
        }
        path.close()
        
        return path
    }
    
    func updatePosition() {
        print(self.percentage)
        self.percentage += 1
        self.progressCurve.removeFromSuperlayer()
        
        self.text.text = String(format: "%.1f", min(percentage - 17.0, 83.0) / 83 * 100) + "%"
        self.text.textColor = UIColor.black
        self.text.font = .systemFont(ofSize: 24.0)
        
        self.progressCurve = CAShapeLayer()
        self.progressCurve.path = createPath().cgPath
        self.progressCurve.fillColor = Constants.green.cgColor
        self.layer.insertSublayer(self.progressCurve, below: self.border.layer)
    }
    
}

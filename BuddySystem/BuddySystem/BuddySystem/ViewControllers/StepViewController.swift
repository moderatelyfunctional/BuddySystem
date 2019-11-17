//
//  StepViewController.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class StepViewController: UIViewController {
    
    let appTitle = BLabel(text: "did you meet your goal yet?", font: .systemFont(ofSize: 48))
    let progressCircle = ProgressCircle()
    var timer:Timer?
    
    let goButton = BImageView(image: UIImage(named: "step_go"))
    let endButton = BImageView(image: UIImage(named: "step_end"))
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.timer = Timer(timeInterval: 1.0, repeats: true, block: { (timer) in
            self.progressCircle.updatePosition()
        })
        
        let startTimer = UITapGestureRecognizer(target: self, action: #selector(StepViewController.startTimer))
        let endTimer = UITapGestureRecognizer(target: self, action: #selector(StepViewController.endTimer))
        
        self.goButton.isUserInteractionEnabled = true
        self.endButton.isUserInteractionEnabled = true
        self.goButton.addGestureRecognizer(startTimer)
        self.endButton.addGestureRecognizer(endTimer)

        self.progressCircle.center = self.view.center
        
        self.view.addSubview(self.appTitle)
        self.view.addSubview(self.progressCircle)
        self.view.addSubview(self.goButton)
        self.view.addSubview(self.endButton)
        addConstraints()
    }
    
    func addConstraints() {        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.appTitle, sides: [.left, .right], padding: 40))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.appTitle, side: .top, padding: 80))
        
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.progressCircle, lowerView: self.goButton, spacing: 30))
        self.view.addConstraint(NSLayoutConstraint(item: self.goButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 0.5, constant: 1.0))
        
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.progressCircle, lowerView: self.endButton, spacing: 30))
        self.view.addConstraint(NSLayoutConstraint(item: self.endButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1.5, constant: 1.0))
    }
    
    @objc func startTimer() {
        if self.timer == nil {
            self.timer = Timer(timeInterval: 1.0, repeats: true, block: { (timer) in
                self.progressCircle.updatePosition()
            })
        }
        RunLoop.main.add(self.timer!, forMode: RunLoop.Mode.default)
    }
    
    @objc func endTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
}

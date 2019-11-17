//
//  WalkViewController.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class WalkViewController: UIViewController {
    
    let appTitle = BLabel(text: "let's get walking!", font: .systemFont(ofSize: 48))
    let desc = BLabel(
        text: "make sure you only tap on the button when you’re ready to go for a walk in the outdoors.",
        font: .systemFont(ofSize: 20))
    let walkButton = BImageView(image: UIImage(named: "go"))
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let stepGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WalkViewController.transitionToStep))
        self.walkButton.isUserInteractionEnabled = true
        self.walkButton.addGestureRecognizer(stepGestureRecognizer)
        
        self.view.backgroundColor = Constants.grey
        self.view.addSubview(self.appTitle)
        self.view.addSubview(self.desc)
        self.view.addSubview(self.walkButton)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.appTitle, side: .left, padding: 40))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.appTitle, side: .top, padding: 80))
        
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.appTitle, lowerView: self.desc, spacing: 20))
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.desc, sides: [.left, .right], padding: 40))
        
        self.view.addConstraint(BConstraint.fillXConstraints(view: self.walkButton, widthRatio: 0.75))
        self.view.addConstraints(BConstraint.centerAlignConstraints(firstView: self.walkButton, secondView: self.view))

    }
    
    @objc func transitionToStep() {
        let customBarController = self.tabBarController as! BTabViewController
        let stepIndex = customBarController.tabImgs.count - 1
        customBarController.customTabBar.selectIndex(index: stepIndex)
        self.tabBarController!.selectedIndex = stepIndex
    }
    
}

//
//  BTabViewController.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class BTabViewController: UITabBarController {
    
    let customTabBar = BTabBar()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let hydrationVC = HydrationViewController()
        let notificationVC = NotificationViewController()
        let walkVC = WalkViewController()
        let stepVC = StepViewController()
        
        self.viewControllers = [hydrationVC, notificationVC, walkVC, stepVC]
        self.selectedIndex = 0
        self.view.backgroundColor = Constants.grey
        
        self.tabBar.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.customTabBar)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.customTabBar, sides: [.left, .bottom, .right], padding: 0))
        self.view.addConstraint(BConstraint.constantConstraint(view: self.customTabBar, attribute: .height, value: 70))
    }
    
}

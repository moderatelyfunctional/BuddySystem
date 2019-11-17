//
//  HydrationViewController.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class HydrationViewController: UIViewController {

    let hydrate = BLabel(text: "hydration", font: .systemFont(ofSize: 40))
    let cups = Cups()
    
    let medicate = BLabel(text: "medication", font: .systemFont(ofSize: 40))
    let pill_one = Pill(pillText: "Aspirine", pillCount: 2, takenAfter: "take after\nbreakfast")
    let pill_two = Pill(pillText: "Protonix", pillCount: 1, takenAfter: "take with a\nbreakfast")
    let pill_three = Pill(pillText: "Aricept", pillCount: 2, takenAfter: "take before\nbedtime")

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.hydrate)
        self.view.addSubview(self.cups)
        self.view.addSubview(self.medicate)
        self.view.addSubview(self.pill_one)
        self.view.addSubview(self.pill_two)
        self.view.addSubview(self.pill_three)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.hydrate, side: .left, padding: 40))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.hydrate, side: .top, padding: 80))
        
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.hydrate, lowerView: self.cups, spacing: 20))
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.cups, sides: [.left, .right], padding: 60))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.cups, heightRatio: 0.1))
        
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.cups, lowerView: self.medicate, spacing: 20))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.medicate, side: .left, padding: 40))

        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.medicate, lowerView: self.pill_one, spacing: 20))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.pill_one, heightRatio: 0.13))
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.pill_one, sides: [.left, .right], padding: 60))
        
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.pill_one, lowerView: self.pill_two, spacing: 30))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.pill_two, heightRatio: 0.13))
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.pill_two, sides: [.left, .right], padding: 60))

        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.pill_two, lowerView: self.pill_three, spacing: 30))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.pill_three, heightRatio: 0.13))
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.pill_three, sides: [.left, .right], padding: 60))
    }
    
}

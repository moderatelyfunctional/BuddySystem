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
    let pill = Pill(pillText: "Aspirine", pillCount: 2, takenAfter: "take after\nbreakfast")
    
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
        self.view.addSubview(self.pill)
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

        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.medicate, lowerView: self.pill, spacing: 20))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.pill, heightRatio: 0.13))
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.pill, sides: [.left, .right], padding: 60))

    }
    
}

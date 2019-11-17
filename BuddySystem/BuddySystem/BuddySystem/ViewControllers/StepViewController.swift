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
    var timer:Timer!
    
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
        RunLoop.main.add(self.timer, forMode: RunLoop.Mode.default)

        self.progressCircle.center = self.view.center
        
        self.view.addSubview(self.appTitle)
        self.view.addSubview(self.progressCircle)
        addConstraints()
    }
    
    func addConstraints() {        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.appTitle, sides: [.left, .right], padding: 40))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.appTitle, side: .top, padding: 80))
        

    }
}

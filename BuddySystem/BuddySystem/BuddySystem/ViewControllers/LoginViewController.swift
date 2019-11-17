//
//  LoginViewController.swift
//  BuddySystem
//
//  Created by Jing Lin on 11/16/19.
//  Copyright © 2019 Jing Lin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var heightConstraint:NSLayoutConstraint!
    let wavyModal = WavyModal()
    let dismissWavy = DismissWavy()
    let loginText = BLabel(text: "welcome back,\nsusan", font: .systemFont(ofSize: 48))
    let signupText = BLabel(text: "first time with\nus?", font: .systemFont(ofSize: 48))
    
    let appTitle = BTitle()
    
    let loginButton = BButton(color: Constants.green, text: "Login")
    let signupButton = BButton(color: Constants.green, text: "Sign Up")
    let background = BImageView(image: UIImage(named: "wavy"))
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        let hideGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideWavy))
        self.dismissWavy.addGestureRecognizer(hideGestureRecognizer)
        self.loginButton.addTarget(self, action: #selector(LoginViewController.showLogin), for: .touchUpInside)
        self.signupButton.addTarget(self, action: #selector(LoginViewController.showSignup), for: .touchUpInside)

        self.loginText.alpha = 0
        self.signupText.alpha = 0
        
        let endEditingRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing))
        self.wavyModal.addGestureRecognizer(endEditingRecognizer)
        self.wavyModal.login.emailField.delegate = self
        self.wavyModal.login.passwordField.delegate = self
        self.wavyModal.submit.addTarget(self, action: #selector(LoginViewController.registerUser), for: .touchUpInside)
        
        self.view.addSubview(self.appTitle)
        self.view.addSubview(self.dismissWavy)
        self.view.addSubview(self.loginButton)
        self.view.addSubview(self.signupButton)
        self.view.insertSubview(self.background, at: 0)

        self.view.addSubview(self.loginText)
        self.view.addSubview(self.signupText)
        self.view.addSubview(self.wavyModal)
        addConstraints()
    }
    
    func addConstraints() {
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.dismissWavy, sides: [.left, .top, .right, .bottom], padding: 0))
        
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.loginText, side: .left, padding: 40))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.loginText, side: .top, padding: 80))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.signupText, side: .left, padding: 40))
        self.view.addConstraint(BConstraint.paddingPositionConstraint(view: self.signupText, side: .top, padding: 80))

        self.heightConstraint = NSLayoutConstraint(item: self.wavyModal, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.wavyModal, sides: [.left, .right], padding: 0))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.wavyModal, heightRatio: 0.7))
        self.view.addConstraint(self.heightConstraint)
        
        self.view.addConstraint(BConstraint.equalConstraint(firstView: self.appTitle, secondView: self.view, attribute: .centerX))
        self.view.addConstraint(NSLayoutConstraint(item: self.appTitle, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 0.7, constant: 0))

        self.view.addConstraints(BConstraint.paddingPositionConstraints(view: self.background, sides: [.left, .right, .bottom], padding: 0))
        self.view.addConstraint(BConstraint.fillXConstraints(view: self.loginButton, widthRatio: 0.7))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.loginButton, heightRatio: 0.06))
        self.view.addConstraint(BConstraint.fillXConstraints(view: self.signupButton, widthRatio: 0.7))
        self.view.addConstraint(BConstraint.fillYConstraints(view: self.signupButton, heightRatio: 0.06))
        
        self.view.addConstraint(NSLayoutConstraint(item: self.loginButton, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.15, constant: 0))
        self.view.addConstraint(BConstraint.equalConstraint(firstView: self.loginButton, secondView: self.view, attribute: .centerX))
        
        self.view.addConstraint(BConstraint.equalConstraint(firstView: self.signupButton, secondView: self.view, attribute: .centerX))
        self.view.addConstraint(BConstraint.verticalSpacingConstraint(upperView: self.loginButton, lowerView: self.signupButton, spacing: 40))
    }
    
    @objc func showLogin() {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.heightConstraint.constant = -UIScreen.main.bounds.height * 0.7
            self.loginText.alpha = 1.0
            self.appTitle.alpha = 0.0
            self.loginButton.alpha = 0.0
            self.signupButton.alpha = 0.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    @objc func showSignup() {
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.heightConstraint.constant = -UIScreen.main.bounds.height * 0.7
            self.signupText.alpha = 1.0
            self.appTitle.alpha = 0.0
            self.loginButton.alpha = 0.0
            self.signupButton.alpha = 0.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func hideWavy() {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.heightConstraint.constant = 0
            self.loginText.alpha = 0.0
            self.signupText.alpha = 0.0
            self.appTitle.alpha = 1.0
            self.loginButton.alpha = 1.0
            self.signupButton.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    @objc func endEditing() {
        self.wavyModal.login.emailField.endEditing(true)
        self.wavyModal.login.passwordField.endEditing(true)
        self.heightConstraint.constant = -UIScreen.main.bounds.height * 0.7
    }
    
    @objc func registerUser() {
        self.wavyModal.login.emailField.endEditing(true)
        self.wavyModal.login.passwordField.endEditing(true)
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
            self.heightConstraint.constant = 0
            self.loginText.alpha = 0.0
            self.signupText.alpha = 0.0
            self.appTitle.alpha = 1.0
            self.loginButton.alpha = 1.0
            self.signupButton.alpha = 1.0
            self.view.layoutIfNeeded()
        }, completion: {
            self.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: <#T##Bool#>, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        }

    }
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseOut, animations: {
                self.heightConstraint.constant = -UIScreen.main.bounds.height
                self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
}

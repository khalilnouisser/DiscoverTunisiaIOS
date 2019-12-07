//
//  LoginViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import FacebookLogin

class LoginViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var mailUITextField: UITextField!
    @IBOutlet var passwordUITextField: UITextField!
    @IBOutlet var submitButton: LoadingButton!
    @IBOutlet var connectWithFb: LoadingButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        mailUITextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "MainLightColor")!])
        passwordUITextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "MainLightColor")!])
        
        mailUITextField.layer.borderColor = UIColor(named: "MainLightColor")!.cgColor
        mailUITextField.layer.borderWidth  = 1.0
        mailUITextField.layer.cornerRadius = 7
        
        passwordUITextField.layer.borderColor = mailUITextField.layer.borderColor
        passwordUITextField.layer.borderWidth = 1.0
        passwordUITextField.layer.cornerRadius = 7
        self.hideKeyboardWhenTappedAround()
        
        textChanged()
    }
    
    @IBAction func textChanged(){
        let email = mailUITextField.text ?? ""
        let password = passwordUITextField.text ?? ""
        
        let valid = email != "" && password != ""
        submitButton.alpha = valid ? 1 : 0.5
        submitButton.isEnabled = valid
    }
    
    
    @IBAction func sumbit(){
        submitButton.showLoading()
        APIService.signin(email: self.mailUITextField.text ?? "", password: self.passwordUITextField.text ?? "") { (user, error) in
            self.submitButton.hideLoading()
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Email or password is incorrect", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            } else {
                AuthService.connectedUser = user
                if let vc = self.storyboard?.instantiateViewController(identifier: "LoadingScreenViewController") {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    @IBAction func loginWithFb(){
        connectWithFb.showLoading()
        APIService.Login.Facebook.login { (user, error) in
            self.connectWithFb.hideLoading()
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Technical error", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            } else {
                AuthService.connectedUser = user
                if let vc = self.storyboard?.instantiateViewController(identifier: "LoadingScreenViewController") {
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    @IBAction func changeLang(){
        Utils.changeLanguage(view: self)
    }
    
    @IBAction func skip(){
        if let vc = self.storyboard?.instantiateViewController(identifier: "LoadingScreenViewController") {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

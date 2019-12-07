//
//  SignUpViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/6/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet var mailUITextField: UITextField!
    @IBOutlet var fullNameUITextField: UITextField!
    @IBOutlet var passwordUITextField: UITextField!
    @IBOutlet var submitButton: LoadingButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullNameUITextField.attributedPlaceholder = NSAttributedString(string: "Full Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "MainLightColor")!])
        mailUITextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "MainLightColor")!])
        passwordUITextField.attributedPlaceholder = NSAttributedString(string: "*********", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "MainLightColor")!])
        
        mailUITextField.layer.borderColor = UIColor(named: "MainLightColor")!.cgColor
        mailUITextField.layer.borderWidth  = 1.0
        mailUITextField.layer.cornerRadius = 7
        
        passwordUITextField.layer.borderColor = mailUITextField.layer.borderColor
        passwordUITextField.layer.borderWidth = 1.0
        passwordUITextField.layer.cornerRadius = 7
        
        fullNameUITextField.layer.borderColor = mailUITextField.layer.borderColor
        fullNameUITextField.layer.borderWidth = 1.0
        fullNameUITextField.layer.cornerRadius = 7
        
        textChanged()
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func textChanged(){
        let name = fullNameUITextField.text ?? ""
        let email = mailUITextField.text ?? ""
        let password = passwordUITextField.text ?? ""
        
        let valid = name != "" && email != "" && isValidEmail(emailStr: email) && password != ""
        submitButton.alpha = valid ? 1 : 0.5
        submitButton.isEnabled = valid
    }
    
    func isValidEmail(emailStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: emailStr)
    }
    
    @IBAction func sumbit(){
        submitButton.showLoading()
        APIService.signup(name: self.fullNameUITextField.text ?? "", email: self.mailUITextField.text ?? "", password: self.passwordUITextField.text ?? "") { (user, error) in
            self.submitButton.hideLoading()
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "An account already exists with this email address", preferredStyle: .alert)
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
    
    @IBAction func goBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func goCGU(){
        if let url = URL(string: "http://discovertunisia.com") {
            UIApplication.shared.open(url)
        }
    }
    
    
    
}

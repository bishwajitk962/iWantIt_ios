//
//  LoginVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 23/05/24.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var lblAppTitle: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblLoginSubText: UILabel!
    @IBOutlet weak var constImgHeight: NSLayoutConstraint!
    @IBOutlet weak var constImgAspectRation: NSLayoutConstraint!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: LoaderButton!
    @IBOutlet weak var btnEyePass: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUiSetup()
        txtEmail.delegate = self
        txtPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        login()
    }
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        goToSignup()
    }
    @IBAction func passEyeBtnAction(_ sender: UIButton) {
        if txtPassword.isSecureTextEntry {
            txtPassword.isSecureTextEntry = false
            btnEyePass.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            txtPassword.isSecureTextEntry = true
            btnEyePass.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    @IBAction func forgotPswBtnAction(_ sender: UIButton) {
        if let forgotVc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordVC") as? ForgotPasswordVC {
            self.navigationController?.pushViewController(forgotVc, animated: true)
        }
    }
}

//MARK: - all functions
extension LoginVC {
    func initialUiSetup() {
        lblAppTitle.font = UIFont(name: "Baloo Da", size: 34)
        lblLogin.font = UIFont(name: "Inter Medium", size: 22)
        lblLoginSubText.font = UIFont(name: "Inter Regular", size: 17)
    }
    
    func login() {
        //TODO: -
        //1. will implement login validation
        if let mainTabVc = self.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController {
            self.navigationController?.pushViewController(mainTabVc, animated: true)
        }
    }
    
    func goToSignup() {
        if let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC {
            self.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
}

//MARK: - textfield delegate
extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case txtEmail:
            txtPassword.becomeFirstResponder()
        case txtPassword:
            txtPassword.resignFirstResponder()
            login()
        default:
            self.view.endEditing(true)
            return true
        }
        return true
    }
}

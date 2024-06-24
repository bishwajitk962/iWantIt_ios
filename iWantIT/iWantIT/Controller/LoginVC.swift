//
//  LoginVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 23/05/24.
//

import UIKit
import FirebaseAuth

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
    @IBOutlet weak var lblError: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUiSetup()
        txtEmail.delegate = self
        txtPassword.delegate = self
        
        txtEmail.text = "alejandrodiez-jr@hotmail.com"
        txtPassword.text = "12345678"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        lblError.text = ""
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        if txtEmail.text?.isEmpty == true {
            lblError.text = "Please enter email."
        } else if txtPassword.text?.isEmpty == true {
            lblError.text = "Please enter password."
        } else {
            login()
        }
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
        
        lblError.text = ""
    }
    
    func login() {
        Auth.auth().signIn(withEmail: txtEmail.text ?? "", password: txtPassword.text ?? "") { [weak self] authResult, error in
            guard let strongSelf = self else {
                self?.lblError.text = "Something is wrong."
                return
            }
            print("point 1.0", authResult)
            print("point 1.1", error?.localizedDescription)
            if authResult != nil {
                print("point 1.2", authResult?.user)
                if let mainTabVc = strongSelf.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController {
                    strongSelf.navigationController?.pushViewController(mainTabVc, animated: true)
                }
            } else {
                strongSelf.lblError.text = "Login failed. Incorrect password or email."
            }
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

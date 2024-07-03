//
//  LoginVC.swift
//  iWantIt iOS
//
//  Created by Supriyo Dey on 26/06/24.
//

import UIKit
import FirebaseAuth


class LoginVC: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var lblAppTitle: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblLoginSubText: UILabel!
    @IBOutlet weak var constImgHeight: NSLayoutConstraint!
    @IBOutlet weak var constImgAspectRation: NSLayoutConstraint!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var btnLogin: LoaderButton!
    @IBOutlet weak var btnEyePass: UIButton!
    @IBOutlet weak var lblError: UILabel!

    //MARK: - lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        lblError.text = ""
    }
    
    //MARK: - IBAction
    @IBAction func actionSignUp(_ sender: UIButton) {
        moveToNext(RegisterVC.typeName, storyBoard: StoryBoard.main)
    }
    
    @IBAction func actionForgotPassword(_ sender: UIButton) {
        moveToNext(ForgotPasswordVC.typeName, storyBoard: StoryBoard.main)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        if txtFldEmail.text?.isEmpty == true {
            lblError.text = "Please enter email."
        } else if txtFldPassword.text?.isEmpty == true {
            lblError.text = "Please enter password."
        } else {
            //moveToNext(CustomTabBarController.typeName, storyBoard: StoryBoard.tab)
            login()
            
        }
    }
    
    @IBAction func passEyeBtnAction(_ sender: UIButton) {
        if txtFldPassword.isSecureTextEntry {
            txtFldPassword.isSecureTextEntry = false
            btnEyePass.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            txtFldPassword.isSecureTextEntry = true
            btnEyePass.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: txtFldEmail.text ?? "", password: txtFldPassword.text ?? "") { [weak self] authResult, error in
            guard let strongSelf = self else {
                self?.lblError.text = "Something is wrong."
                return
            }
            print("point 1.0", authResult)
            print("point 1.1", error?.localizedDescription)
            if authResult != nil {
                print("point 1.2", authResult?.user)
//                if let mainTabVc = strongSelf.storyboard?.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController {
//                    strongSelf.navigationController?.pushViewController(mainTabVc, animated: true)
//                }
                
                let storyboard = UIStoryboard(name: "Tab", bundle: nil)
                if let mainTabVc = storyboard.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController {
                    self?.navigationController?.pushViewController(mainTabVc, animated: true)
                }
                
            } else {
                strongSelf.lblError.text = "Login failed. Incorrect password or email."
            }
        }
        
    }
}

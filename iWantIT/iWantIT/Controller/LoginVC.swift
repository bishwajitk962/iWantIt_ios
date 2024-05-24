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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUiSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        
    }
    @IBAction func signUpBtnAction(_ sender: UIButton) {
        goToSignup()
    }
}

//MARK: - all functions
extension LoginVC {
    func initialUiSetup() {
        lblAppTitle.font = UIFont(name: "Baloo Da", size: 34)
        lblLogin.font = UIFont(name: "Inter Medium", size: 22)
        lblLoginSubText.font = UIFont(name: "Inter Regular", size: 17)
    }
    
    func goToSignup() {
        if let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC {
            self.navigationController?.pushViewController(signUpVc, animated: true)
        }
    }
}

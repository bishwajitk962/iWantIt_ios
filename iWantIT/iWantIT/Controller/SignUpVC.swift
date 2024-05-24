//
//  SignUpVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 24/05/24.
//

import UIKit

class SignUpVC: UIViewController {
    @IBOutlet weak var lblSignUp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUiSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @IBAction func loginBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//MARK: - other methods
extension SignUpVC {
    func initialUiSetup() {
        lblSignUp.font = UIFont(name: "Inter Medium", size: 22)
    }
}

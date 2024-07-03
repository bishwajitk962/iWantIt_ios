//
//  ForgotPasswordVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 29/05/24.
//

import UIKit
import FirebaseAuth

//class ForgotPasswordVC: UIViewController {
//    
//    //MARK: - IBOutlet
//    @IBOutlet weak var txtFieldEmail: UITextField!
//    @IBOutlet weak var lblError: UILabel!
//    //MARK: - LifeCycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//    override func viewWillAppear(_ animated: Bool) {
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
//    }
//    //MARK: - IBAction
//    @IBAction func backBtnAction(_ sender: UIButton) {
//        
////        if txtFieldEmail.text?.isEmpty == true {
////            lblError.isHidden = false
////            lblError.text = "Please enter a valid email address."
////        }else {
//            popToBack()
//       // }
//      
//    }
//    
//    @IBAction func actionSUbmit(_ sender: UIButton) {
//                if txtFieldEmail.text?.isEmpty == true {
//                    lblError.isHidden = false
//                    lblError.text = "Please enter a valid email address."
//                }else {
//                   // popToBack()
//                }
//    }
//}

class ForgotPasswordVC: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var lblError: UILabel!

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        lblError.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    //MARK: - IBAction
    @IBAction func backBtnAction(_ sender: UIButton) {
        popToBack()
    }

    @IBAction func actionSubmit(_ sender: UIButton) {
        guard let email = txtFieldEmail.text, !email.isEmpty else {
            lblError.isHidden = false
            lblError.text = "Please enter a valid email address."
            return
        }

        // Use Firebase Authentication to send password reset email
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                // Display error
                self.lblError.isHidden = false
                self.lblError.text = "Error: \(error.localizedDescription)"
            } else {
                // Password reset email sent
                self.lblError.isHidden = false
                self.lblError.text = "Password reset email sent successfully."
            }
        }
    }
}

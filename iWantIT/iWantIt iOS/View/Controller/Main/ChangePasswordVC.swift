//
//  ChangePasswordVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 06/06/24.
//

import UIKit
import FirebaseAuth

class ChangePasswordVC: UIViewController {
    //MARK: - IBOutlet
    
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldNewPassword: UITextField!
    @IBOutlet weak var txtFldConfrmPassword: UITextField!
    
    @IBOutlet weak var lblCurrentPwdErrorMessage: UILabel!
    
    @IBOutlet weak var lblNewPwdErrorMessage: UILabel!
    
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //MARK: - IBAction
    @IBAction func backBtnAction(_ sender: UIButton) {
        popToBack()
    }
    
    @IBAction func actionSubmit(_ sender: UIButton) {
        guard let currentPassword = txtFldPassword.text, !currentPassword.isEmpty,
                      let newPassword = txtFldNewPassword.text, !newPassword.isEmpty,
                      let confirmPassword = txtFldConfrmPassword.text, !confirmPassword.isEmpty else {
                          print("Please fill all fields")
                          return
                }
                
                guard newPassword == confirmPassword else {
                    print("New passwords do not match")
                    return
                }
                
                // Re-authenticate the user with the current password
                reauthenticateUser(currentPassword: currentPassword) { [weak self] success in
                    guard success else {
                        print("Re-authentication failed")
                        return
                    }
                    
                    // Update the password
                    self?.updatePassword(newPassword: newPassword)
                }
        
    }
    
    private func reauthenticateUser(currentPassword: String, completion: @escaping (Bool) -> Void) {
           guard let user = Auth.auth().currentUser, let email = user.email else {
               completion(false)
               return
           }
           
           let credential = EmailAuthProvider.credential(withEmail: email, password: currentPassword)
           user.reauthenticate(with: credential) { result, error in
               if let error = error {
                   print("Re-authentication error: \(error.localizedDescription)")
                   completion(false)
               } else {
                   completion(true)
               }
           }
       }
       
       private func updatePassword(newPassword: String) {
           Auth.auth().currentUser?.updatePassword(to: newPassword) { error in
               if let error = error {
                   print("Password update error: \(error.localizedDescription)")
               } else {
                   print("Password updated successfully")
                   // Navigate back or show success message
               }
           }
       }
    
    
}

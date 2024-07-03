//
//  RegisterVC.swift
//  iWantIt iOS
//
//  Created by Supriyo Dey on 26/06/24.
//

import UIKit
import AVFoundation
import Firebase /*FirebaseAuth*/
import FirebaseStorage /*FirebaseStorage*/
import FirebaseFirestore


class RegisterVC: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet var imageVwProfile: UIImageView!
    @IBOutlet weak var txtFldFullName: UITextField!
    @IBOutlet weak var txtFldUserName: UITextField!
    @IBOutlet weak var txtFldEmail: UITextField!
    @IBOutlet weak var txtFldPassword: UITextField!
    @IBOutlet weak var txtFldConfirmPassword: UITextField!
    @IBOutlet weak var lblError: UILabel!
    
    let allowedEmailDomains = ["bc.edu", "bentley.edu", "bu.edu", "cambridgecollege.edu", "emerson.edu", "harvard.edu", "lesley.edu", "massart.edu","mcphs.edu","mit.edu","northeastern.edu","simmons.edu","suffolk.edu","supercaca@caca","tufts.edu","umb.edu","wit.edu"]
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    //MARK: - IBAction
    @IBAction func loginBtnAction(_ sender: UIButton) {
        popToBack()
    }
    @IBAction func actionProfileImageClick(_ sender: UIButton) {
        MediaPicker.shared.setupPicker(delegate: self, allowVideoSelectionOnly: false)
        MediaPicker.shared.openActionSheetForImagePicker()
    }
    @IBAction func actionCkeckTearmsandprivacy(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func actionEyeBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.tag == 0 {
            txtFldPassword.isSecureTextEntry = !sender.isSelected
        } else if sender.tag == 1 {
            txtFldConfirmPassword.isSecureTextEntry = !sender.isSelected
        }
    }
    
    @IBAction func actionSignUp(_ sender: UIButton) {
        lblError.isHidden = true
        if txtFldFullName.text?.isEmpty == true {
            lblError.isHidden = false
            lblError.text = "Invalid full name."
        } else if txtFldUserName.text?.isEmpty == true {
            lblError.isHidden = false
            lblError.text = "Invalid username."
        }else if txtFldEmail.text?.isEmpty == true {
            lblError.isHidden = false
            lblError.text = "Invalid email."
        }else if !(isValidEmail(txtFldEmail.text ?? "")) {
            lblError.isHidden = false
            lblError.text = "email doesn't have valid domain."
        }else if txtFldPassword.text?.isEmpty == true {
            lblError.isHidden = false
            lblError.text = "Invalid password."
        }
        else if txtFldConfirmPassword.text?.isEmpty == true {
            lblError.isHidden = false
            lblError.text = "Invalid confirm password."
        }else if txtFldPassword.text != txtFldConfirmPassword.text {
            lblError.isHidden = false
            lblError.text = "Password is not same."
        }
        else {
            //moveToNext(CustomTabBarController.typeName, storyBoard: StoryBoard.tab)
            
            registerUser()
        }
    }
    
    // Function to validate email address
    func isValidEmail(_ email: String) -> Bool {
        // Check if the email contains "@" and split into username and domain parts
        guard let atIndex = email.firstIndex(of: "@") else {
            return false
        }
        
        let username = email[..<atIndex]
        let domain = email[email.index(after: atIndex)...]
        
        // Validate the username part using a simple regex
        let usernameRegex = "^[A-Za-z0-9._%+-]+$"
        let usernamePredicate = NSPredicate(format: "SELF MATCHES %@", usernameRegex)
        
        if !usernamePredicate.evaluate(with: username) {
            return false
        }
        
        // Check if the domain is in the list of allowed domains
        return allowedEmailDomains.contains(String(domain))
    }
    
    func registerUser() {
        guard let email = txtFldEmail.text, let password = txtFldPassword.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.lblError.isHidden = false
                self.lblError.text = "Error: \(error.localizedDescription)"
                return
            }
            
            guard let uid = authResult?.user.uid else { return }
            
            print("uid :: ", uid)
            
            // Upload profile picture
            self.uploadProfilePicture(uid: uid) { url in
                guard let url = url else {
                    self.lblError.isHidden = false
                    self.lblError.text = "Failed to upload profile picture."
                    return
                }
                
                print("url :: ", url)
                // Save user data
                self.saveUserData(uid: uid, profileImageUrl: url)
            }
        }
    }
    
    func uploadProfilePicture(uid: String, completion: @escaping (URL?) -> Void) {
        guard let image = imageVwProfile.image, let imageData = image.jpegData(compressionQuality: 0.75) else {
            completion(nil)
            return
        }
        
        let storageRef = Storage.storage().reference().child("IWTProfileImg/\(uid).jpg")
        // IWTProfileImg
        // profile_pictures
        
        storageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading profile picture: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            storageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error.localizedDescription)")
                    completion(nil)
                    return
                }
                completion(url)
            }
        }
    }
    
    func saveUserData(uid: String, profileImageUrl: URL) {
        let db = Firestore.firestore()
        let userData: [String: Any] = 
        
//        [
//            "fullName": txtFldFullName.text ?? "",
//            "userName": txtFldUserName.text ?? "",
//            "email": txtFldEmail.text ?? "",
//            "profileImageUrl": profileImageUrl.absoluteString
//        ]
        
        ["chatIds":"",
         "dislikedForumPostIsd":"",
         "email": txtFldEmail.text ?? "",
         "forumCommentsId":"",
         "forumIds":"",
         "fullname":txtFldFullName.text ?? "",
         "likedForumPostsId":"",
         "postIds":"",
         "profilePic":profileImageUrl.absoluteString,
         "soldItemsId":"",
         "university":"harvard.edu",
         "userId": uid,
         "username": txtFldUserName.text ?? ""]
        
        db.collection("iWantItUsers").document(uid).setData(userData) { error in
            if let error = error {
                self.lblError.isHidden = false
                self.lblError.text = "Error saving user data: \(error.localizedDescription)"
                return
            }
            
            // Move to next screen
            self.moveToNext(CustomTabBarController.typeName, storyBoard: StoryBoard.tab)
        }
    }

    func isValidEmail(email: String) -> Bool {
        // Regular expression pattern for matching specific domains
        let pattern = "^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.(bc|bentley|bu)\\.edu$"
        
        // Create a regular expression object
        let regex = try! NSRegularExpression(pattern: pattern, options: [.caseInsensitive])
        
        // Check if the email matches the pattern
        let matches = regex.matches(in: email, options: [], range: NSRange(location: 0, length: email.count))
        
        // Return true if there's at least one match, false otherwise
        return matches.count > 0
    }
}


//MARK: Image Picker
extension RegisterVC : MediaPickerDelegate{
    func mediaPicker(_ mediaPicker: MediaPicker, didChooseImage image: UIImage?, imageName: String?) {
        imageVwProfile.image = image
        if imageVwProfile != nil {
            //            let vc = UIStoryboard.init(name: "Profile", bundle: Bundle.main).instantiateViewController(withIdentifier: "TakeSelfieNext") as? TakeSelfieNext
            // vc?.imgProfile = image
            // self.navigationController?.pushViewController(vc!, animated: true)
        }
    }
}


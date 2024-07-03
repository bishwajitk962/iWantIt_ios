//
//  CustomTabBarController.swift
//  iWantIT
//
//  Created by Supriyo Dey on 29/05/24.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.selectedIndex = 1
    }

    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PlaceholderViewController {
            let vc = StoryBoard.tab.instantiateViewController(withIdentifier: CenterBtnPopUp.typeName) as! CenterBtnPopUp
            
            vc.cb = {
                type in
                if type == "marketplace_Click"{
                    self.moveToNext(MarketUploadVC.typeName,storyBoard: StoryBoard.centerMenu)
                }else if type == "coummity_Click" {
                    self.moveToNext(CommunityPostVC.typeName,storyBoard: StoryBoard.centerMenu)
                }
            }
            self.present(vc, animated: false, completion: nil)
            
            return false
        }
        return true
    }
    
    func openActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Marketplace", style: .default, handler: { _ in
            if let marketPostVc = self.storyboard?.instantiateViewController(withIdentifier: "MarketUploadVC") as? MarketUploadVC {
                marketPostVc.modalPresentationStyle = .overFullScreen
                self.present(marketPostVc, animated: true)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Community", style: .default, handler: { _ in
            if let commutityPostVc = self.storyboard?.instantiateViewController(withIdentifier: "CommunityPostVC") as? CommunityPostVC {
                commutityPostVc.modalPresentationStyle = .overFullScreen
                self.present(commutityPostVc, animated: true)
            }
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(actionSheet, animated: true)
    }

    func presentImagePicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    // UIImagePickerControllerDelegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            // Handle the picked image here
            print("Image picked: \(pickedImage)")
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

class PlaceholderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

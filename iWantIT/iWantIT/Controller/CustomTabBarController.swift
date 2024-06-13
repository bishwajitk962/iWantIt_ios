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
    }

    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PlaceholderViewController {
            openActionSheet()
            return false
        }
        return true
    }
    
    func openActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Marketplace", style: .default, handler: { _ in
            //TODO: -
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
    //Empty view controller
}

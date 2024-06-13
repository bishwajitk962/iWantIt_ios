//
//  CommunityPostVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 13/06/24.
//

import UIKit

class CommunityPostVC: UIViewController {
    @IBOutlet weak var vwTitleContainer: UIView!
    @IBOutlet weak var txtDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }
    @IBAction func crossBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func initialUISetup() {
        vwTitleContainer.layer.borderColor = UIColor.systemGray.cgColor
        vwTitleContainer.layer.borderWidth = 1
        vwTitleContainer.layer.cornerRadius = 5
        
        txtDescription.layer.borderColor = UIColor.systemGray.cgColor
        txtDescription.layer.borderWidth = 1
        txtDescription.layer.cornerRadius = 5
    }
}

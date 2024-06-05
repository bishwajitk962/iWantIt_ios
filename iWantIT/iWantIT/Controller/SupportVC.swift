//
//  SupportVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 05/06/24.
//

import UIKit

class SupportVC: UIViewController {
    @IBOutlet weak var txtTitleField: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    @IBOutlet weak var vwTitleContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUiSetup()
    }
    
    func initialUiSetup() {
        vwTitleContainer.layer.borderColor = UIColor.systemGray2.cgColor
        vwTitleContainer.layer.borderWidth = 1
        vwTitleContainer.layer.cornerRadius = 5
        
        txtDescription.layer.borderColor = UIColor.systemGray2.cgColor
        txtDescription.layer.borderWidth = 1
        txtDescription.layer.cornerRadius = 5
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

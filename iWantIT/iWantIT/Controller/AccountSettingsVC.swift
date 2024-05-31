//
//  AccountSettingsVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 31/05/24.
//

import UIKit

class AccountSettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

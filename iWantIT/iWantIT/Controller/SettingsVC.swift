//
//  SettingsVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 30/05/24.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

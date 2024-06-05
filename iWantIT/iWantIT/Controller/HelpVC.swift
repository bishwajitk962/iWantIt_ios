//
//  HelpVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 05/06/24.
//

import UIKit

class HelpVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func supportBtnAction(_ sender: UIButton) {
        if let supportVc = self.storyboard?.instantiateViewController(withIdentifier: "SupportVC") as? SupportVC {
            self.navigationController?.pushViewController(supportVc, animated: true)
        }
    }
}
//
//  PaymentsVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 05/06/24.
//

import UIKit

class PaymentsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

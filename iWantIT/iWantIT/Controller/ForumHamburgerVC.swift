//
//  ForumHamburgerVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 12/06/24.
//

import UIKit

class ForumHamburgerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

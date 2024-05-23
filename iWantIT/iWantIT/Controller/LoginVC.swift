//
//  LoginVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 23/05/24.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var lblAppTitle: UILabel!
    @IBOutlet weak var lblLogin: UILabel!
    @IBOutlet weak var lblLoginSubText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialUiSetup()
    }
    
    func initialUiSetup() {
        lblAppTitle.font = UIFont(name: "Baloo Da", size: 34)
        lblLogin.font = UIFont(name: "Inter Bold", size: 22)
        lblLoginSubText.font = UIFont(name: "Inter Regular", size: 17)
    }
}

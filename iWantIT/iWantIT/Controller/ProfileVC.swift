//
//  ProfileVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 29/05/24.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var lblUsrname: UILabel!
    @IBOutlet weak var lblUserFullName: UILabel!
    @IBOutlet weak var imgProfilePic: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }
    @IBAction func settingBtnAction(_ sender: UIButton) {
        if let settingVc = self.storyboard?.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsVC {
            self.navigationController?.pushViewController(settingVc, animated: true)
        }
    }
}

//MARK: - other methods
extension ProfileVC {
    func initialUISetup() {
        lblUsrname.font = UIFont(name: "Cabin Bold", size: 18)
        lblUserFullName.font = UIFont(name: "Cabin Regular", size: 18)
        
    }
}

//
//  AboutUsVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 05/06/24.
//

import UIKit

class AboutUsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func aboutUsBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func termsAndConditionBtnAction(_ sender: UIButton) {
//        if let tNcVc = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditionVC") as? TermsAndConditionVC {
//            tNcVc.navType = "T"
//            self.navigationController?.pushViewController(tNcVc, animated: true)
//        }
    }
    @IBAction func privacyPolicyBtnAction(_ sender: UIButton) {
//        if let tNcVc = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditionVC") as? TermsAndConditionVC {
//            tNcVc.navType = "P"
//            self.navigationController?.pushViewController(tNcVc, animated: true)
//        }
    }
}

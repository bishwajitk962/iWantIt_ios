//
//  SettingsVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 30/05/24.
//

import UIKit

class SettingsVC: UIViewController {
    @IBOutlet weak var vwAlertPopup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func logoutBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.vwAlertPopup.alpha = 1
            self.vwAlertPopup.isHidden = false
        } completion: { _ in
            self.vwAlertPopup.isHidden = false
        }
    }
    @IBAction func neverMindAlertBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.vwAlertPopup.alpha = 0
        } completion: { _ in
            self.vwAlertPopup.isHidden = true
        }
    }
    @IBAction func confirmAlertBtnAction(_ sender: UIButton) {
        vwAlertPopup.isHidden = true
        vwAlertPopup.alpha = 0
        
        if let viewControllers = navigationController?.viewControllers {
            for viewController in viewControllers {
                if let loginVc = viewController as? LoginVC {
                    navigationController?.popToViewController(loginVc, animated: true)
                    break
                }
            }
        }

    }
    
    @IBAction func accoutnSettingsBtnAction(_ sender: UIButton) {
        if let accountVc = self.storyboard?.instantiateViewController(withIdentifier: "AccountSettingsVC") as? AccountSettingsVC {
            self.navigationController?.pushViewController(accountVc, animated: true)
        }
    }
    
}

extension SettingsVC {
    func initialUISetup() {
        vwAlertPopup.isHidden = true
        vwAlertPopup.alpha = 0
    }
}

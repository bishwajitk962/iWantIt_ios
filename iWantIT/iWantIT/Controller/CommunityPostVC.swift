//
//  CommunityPostVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 13/06/24.
//

import UIKit

class CommunityPostVC: UIViewController {
    @IBOutlet weak var vwTitleContainer: UIView!
    @IBOutlet weak var txtDescription: UITextView!
    
    //tags
    @IBOutlet weak var vwTagOne: UIView!
    @IBOutlet weak var vwTag2: UIView!
    @IBOutlet weak var vwTag3: UIView!
    @IBOutlet weak var vwTag4: UIView!
    @IBOutlet weak var vwTag5: UIView!
    @IBOutlet weak var vwTag6: UIView!
    @IBOutlet weak var vwTag7: UIView!
    @IBOutlet weak var vwTag8: UIView!
    @IBOutlet weak var vwTag9: UIView!
    @IBOutlet weak var vwTag10: UIView!
    @IBOutlet weak var vwTag11: UIView!
    @IBOutlet weak var vwTag12: UIView!
    @IBOutlet weak var vwTag13: UIView!
    @IBOutlet weak var vwTag14: UIView!
    @IBOutlet weak var vwTag15: UIView!
    @IBOutlet weak var vwAlertPopup: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }
    
    @IBAction func crossBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.vwAlertPopup.alpha = 1
            self.vwAlertPopup.isHidden = false
        } completion: { _ in
            self.vwAlertPopup.isHidden = false
        }
    }
    @IBAction func nevermindBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            self.vwAlertPopup.alpha = 0
        } completion: { _ in
            self.vwAlertPopup.isHidden = true
        }
    }
    @IBAction func exitBtnAction(_ sender: UIButton) {
        vwAlertPopup.isHidden = true
        vwAlertPopup.alpha = 0
        self.dismiss(animated: true)
    }
    
    func initialUISetup() {
        vwAlertPopup.alpha = 0
        vwAlertPopup.isHidden = true
        
        vwTitleContainer.layer.borderColor = UIColor.systemGray.cgColor
        vwTitleContainer.layer.borderWidth = 1
        vwTitleContainer.layer.cornerRadius = 5
        
        txtDescription.layer.borderColor = UIColor.systemGray.cgColor
        txtDescription.layer.borderWidth = 1
        txtDescription.layer.cornerRadius = 5
        
        vwTagOne.layer.borderColor = UIColor.systemGray2.cgColor
        vwTagOne.layer.borderWidth = 1
        vwTagOne.layer.shadowColor = UIColor.black.cgColor
        vwTagOne.layer.shadowOpacity = 0.25
        vwTagOne.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTagOne.layer.shadowRadius = 2
        
        vwTag2.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag2.layer.borderWidth = 1
        vwTag2.layer.shadowColor = UIColor.black.cgColor
        vwTag2.layer.shadowOpacity = 0.25
        vwTag2.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag2.layer.shadowRadius = 2
        
        vwTag3.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag3.layer.borderWidth = 1
        vwTag3.layer.shadowColor = UIColor.black.cgColor
        vwTag3.layer.shadowOpacity = 0.25
        vwTag3.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag3.layer.shadowRadius = 2
        
        vwTag4.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag4.layer.borderWidth = 1
        vwTag4.layer.shadowColor = UIColor.black.cgColor
        vwTag4.layer.shadowOpacity = 0.25
        vwTag4.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag4.layer.shadowRadius = 2
        
        vwTag5.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag5.layer.borderWidth = 1
        vwTag5.layer.shadowColor = UIColor.black.cgColor
        vwTag5.layer.shadowOpacity = 0.25
        vwTag5.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag5.layer.shadowRadius = 2
        
        vwTag6.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag6.layer.borderWidth = 1
        vwTag6.layer.shadowColor = UIColor.black.cgColor
        vwTag6.layer.shadowOpacity = 0.25
        vwTag6.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag6.layer.shadowRadius = 2
        
        vwTag7.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag7.layer.borderWidth = 1
        vwTag7.layer.shadowColor = UIColor.black.cgColor
        vwTag7.layer.shadowOpacity = 0.25
        vwTag7.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag7.layer.shadowRadius = 2
        
        vwTag8.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag8.layer.borderWidth = 1
        vwTag8.layer.shadowColor = UIColor.black.cgColor
        vwTag8.layer.shadowOpacity = 0.25
        vwTag8.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag8.layer.shadowRadius = 2
        
        vwTag9.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag9.layer.borderWidth = 1
        vwTag9.layer.shadowColor = UIColor.black.cgColor
        vwTag9.layer.shadowOpacity = 0.25
        vwTag9.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag9.layer.shadowRadius = 2
        
        vwTag10.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag10.layer.borderWidth = 1
        vwTag10.layer.shadowColor = UIColor.black.cgColor
        vwTag10.layer.shadowOpacity = 0.25
        vwTag10.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag10.layer.shadowRadius = 2
        
        vwTag11.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag11.layer.borderWidth = 1
        vwTag11.layer.shadowColor = UIColor.black.cgColor
        vwTag11.layer.shadowOpacity = 0.25
        vwTag11.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag11.layer.shadowRadius = 2
        
        vwTag12.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag12.layer.borderWidth = 1
        vwTag12.layer.shadowColor = UIColor.black.cgColor
        vwTag12.layer.shadowOpacity = 0.25
        vwTag12.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag12.layer.shadowRadius = 2
        
        vwTag13.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag13.layer.borderWidth = 1
        vwTag13.layer.shadowColor = UIColor.black.cgColor
        vwTag13.layer.shadowOpacity = 0.25
        vwTag13.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag13.layer.shadowRadius = 2
        
        vwTag14.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag14.layer.borderWidth = 1
        vwTag14.layer.shadowColor = UIColor.black.cgColor
        vwTag14.layer.shadowOpacity = 0.25
        vwTag14.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag14.layer.shadowRadius = 2
        
        vwTag15.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag15.layer.borderWidth = 1
        vwTag15.layer.shadowColor = UIColor.black.cgColor
        vwTag15.layer.shadowOpacity = 0.25
        vwTag15.layer.shadowOffset = CGSize(width: 0, height: 2)
        vwTag15.layer.shadowRadius = 2
    }

}

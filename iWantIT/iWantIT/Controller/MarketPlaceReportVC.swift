//
//  MarketPlaceReportVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 12/06/24.
//

import UIKit

class MarketPlaceReportVC: UIViewController {
    @IBOutlet weak var vwTitleContainer: UIView!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUiSetup()
    }
    
    func initialUiSetup() {
        vwTitleContainer.layer.borderColor = UIColor.systemGray2.cgColor
        vwTitleContainer.layer.borderWidth = 1
        vwTitleContainer.layer.cornerRadius = 5
        
        txtDescription.layer.borderColor = UIColor.systemGray2.cgColor
        txtDescription.layer.borderWidth = 1
        txtDescription.layer.cornerRadius = 5
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

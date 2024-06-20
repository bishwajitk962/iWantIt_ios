//
//  MarketUploadVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 20/06/24.
//

import UIKit

class MarketUploadVC: UIViewController {
    @IBOutlet weak var vwTitleContainer: UIView!
    @IBOutlet weak var vwDescriptionContainer: UIView!
    @IBOutlet weak var vwPriceContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }
    @IBAction func closeBtnAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    func initialUISetup() {
        vwTitleContainer.layer.borderColor = UIColor.systemGray2.cgColor
        vwTitleContainer.layer.borderWidth = 1
        vwTitleContainer.layer.cornerRadius = 5
        
        vwDescriptionContainer.layer.borderColor = UIColor.systemGray2.cgColor
        vwDescriptionContainer.layer.borderWidth = 1
        vwDescriptionContainer.layer.cornerRadius = 5
        
        vwPriceContainer.layer.borderColor = UIColor.systemGray2.cgColor
        vwPriceContainer.layer.borderWidth = 1
        vwPriceContainer.layer.cornerRadius = 5
    }
}

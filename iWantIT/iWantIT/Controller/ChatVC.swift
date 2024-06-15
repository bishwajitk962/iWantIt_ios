//
//  ChatVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 15/06/24.
//

import UIKit

class ChatVC: UIViewController {
    @IBOutlet weak var vwNavContainer: UIView!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var vwMsgTxtContainer: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
    }
    
    func initialUISetup() {
        vwNavContainer.layer.cornerRadius = 12
        vwNavContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        vwMsgTxtContainer.layer.cornerRadius = 17
    }
}

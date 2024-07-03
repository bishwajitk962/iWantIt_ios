//
//  CenterBtnPopUp.swift
//  iWantIt iOS
//
//  Created by Supriyo Dey on 28/06/24.
//

import UIKit

class CenterBtnPopUp: UIViewController {
    
    typealias backVC = (String) -> ()
    //MARK: - Variables
    var cb : backVC?

    //MARK: - IBOutlet
    @IBOutlet weak var vWCenterBtn: UIView!
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                self.view.addGestureRecognizer(tapGesture)
    }

    @objc func handleTap() {
         self.dismiss(animated: false, completion: nil)
     }
    
    //MARK: - IBAction
    @IBAction func actionCenterBtnClick(_ sender: UIButton) {
        if sender.tag == 0 {
            guard let cb = cb else{
                return
            }
            cb("marketplace_Click")
            dismiss(animated: true, completion: nil)
        }else {
            guard let cb = cb else{
                return
            }
            cb("coummity_Click")
            dismiss(animated: true, completion: nil)
        }
    }
}




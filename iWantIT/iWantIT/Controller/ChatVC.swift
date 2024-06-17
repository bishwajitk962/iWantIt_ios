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
    @IBOutlet weak var tblChat: UITableView!
    @IBOutlet weak var vwUploadFilePopup: UIView!
    @IBOutlet weak var vwMoreOptions: UIView!
    @IBOutlet weak var vwReportUserConfirmationPopup: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
        tblChat.dataSource = self
    }
    @IBAction func cancelUploadBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func uploadBtnAction(_ sender: UIButton) {
        vwUploadFilePopup.isHidden = true
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func moreOptionsBtnAction(_ sender: UIButton) {
        vwMoreOptions.isHidden.toggle()
    }
    @IBAction func deleteChatBtnAction(_ sender: UIButton) {
        vwMoreOptions.isHidden = true
    }
    @IBAction func reportUserBtnAction(_ sender: UIButton) {
        vwMoreOptions.isHidden = true
        UIView.animate(withDuration: 0.3) {
            self.vwReportUserConfirmationPopup.alpha = 1
            self.vwReportUserConfirmationPopup.isHidden = false
        } completion: { _ in
            self.vwReportUserConfirmationPopup.isHidden = false
        }
    }
    @IBAction func blockUserBtnAction(_ sender: UIButton) {
        vwMoreOptions.isHidden = true
    }
    @IBAction func reportNevermindBtnAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.vwReportUserConfirmationPopup.alpha = 0
        } completion: { _ in
            self.vwReportUserConfirmationPopup.isHidden = true
        }
    }
    @IBAction func reportConfirmBtnAction(_ sender: UIButton) {
        vwReportUserConfirmationPopup.alpha = 0
        vwReportUserConfirmationPopup.isHidden = true
        
        if let reportVc = self.storyboard?.instantiateViewController(withIdentifier: "MarketPlaceReportVC") as? MarketPlaceReportVC {
            self.navigationController?.pushViewController(reportVc, animated: true)
        }
    }
    
    func initialUISetup() {
        vwNavContainer.layer.cornerRadius = 12
        vwNavContainer.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        vwMsgTxtContainer.layer.cornerRadius = 17
        
        tblChat.transform = CGAffineTransform(scaleX: 1, y: -1)  //to populate chat from bottom
        
        vwMoreOptions.isHidden = true
        vwMoreOptions.layer.shadowColor = UIColor.black.cgColor
        vwMoreOptions.layer.shadowOpacity = 0.25
        vwMoreOptions.layer.shadowOffset = CGSize(width: 0, height: 0)
        vwMoreOptions.layer.shadowRadius = 10
        
        vwReportUserConfirmationPopup.alpha = 0
        vwReportUserConfirmationPopup.isHidden = true
    }
}

extension ChatVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatTVC", for: indexPath) as! ChatTVC
        cell.transform = CGAffineTransform(scaleX: 1, y: -1)
        return cell
    }
}

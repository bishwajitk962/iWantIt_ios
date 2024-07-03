//
//  ForumMainVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 06/06/24.
//

import UIKit

class ForumMainVC: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet weak var tblForums: UITableView!
    @IBOutlet weak var vwHambargerBackgroundView: UIView!
    @IBOutlet weak var vwHambargerView: UIView!
    @IBOutlet weak var constHamburgerTrailing: NSLayoutConstraint!
    @IBOutlet weak var vwCustomTag: UIView!
    @IBOutlet weak var tblTags: UITableView!
    @IBOutlet weak var vwCustomTagContainer: UIView!
    
    //MARK: - Variable
    private let tags = ["Service Request", "Academic Help", "Facts"]
    private var selectedTagIndex: [Int] = []
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tblForums.delegate = self
        tblForums.dataSource = self
        tblTags.dataSource = self
        tblTags.delegate = self
        initialUISetup()
        
    }
    //MARK: - IBAction
    @IBAction func commentsBtnAction(_ sender: UIButton) {
        if let forumCommentsVc = self.storyboard?.instantiateViewController(withIdentifier: "ForumCommentsVC") as? ForumCommentsVC {
            self.navigationController?.pushViewController(forumCommentsVc, animated: true)
        }
    }
    @IBAction func hamburgerMenuBtnAction(_ sender: UIButton) {
        showHamburger()
    }
    @IBAction func backHambarger(_ sender: UIButton) {
        hideHamburger()
    }
    
    
    //MARK: - Function
    func initialUISetup() {
        vwHambargerBackgroundView.isHidden = true
        vwHambargerBackgroundView.alpha = 0
        constHamburgerTrailing.constant = -280
        vwCustomTag.layer.cornerRadius = 13
        vwCustomTag.layer.borderColor = UIColor.systemGray2.cgColor
        vwCustomTag.layer.borderWidth = 1
        vwCustomTag.layer.shadowColor = UIColor.lightGray.cgColor
        vwCustomTag.layer.shadowRadius = 1.5
        vwCustomTag.layer.shadowOffset = CGSize(width: 1, height: 1)
        vwCustomTag.layer.shadowOpacity = 1
        vwCustomTagContainer.isHidden  = true
    }
    
    func showHamburger() {
        constHamburgerTrailing.constant = 0
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.vwHambargerBackgroundView.alpha = 1
            self.vwHambargerBackgroundView.isHidden = false
        } completion: { _ in
            self.vwHambargerBackgroundView.isHidden = false
        }
    }
    
    func hideHamburger() {
        constHamburgerTrailing.constant = -280
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.vwHambargerBackgroundView.alpha = 0
        } completion: { _ in
            self.vwHambargerBackgroundView.isHidden = true
        }
    }
}

//MARK: - TableView Delegate and DataSource
extension ForumMainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblForums {
            return 5
        } else if tableView == tblTags {
            return tags.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblForums {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForumTVC", for: indexPath) as! ForumTVC
            return cell
        } else if tableView == tblTags {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ForumTagsCell", for: indexPath) as! ForumTagsCell
            cell.lblTag.text = tags[indexPath.row]
            cell.btnTag.tag = indexPath.row
            cell.btnTag.addTarget(self, action: #selector(tagBtnAction(_:)), for: .touchUpInside)
            
            if selectedTagIndex.contains(indexPath.row) {
                //selected view
                cell.vwTag.layer.borderColor = UIColor.appTheme.cgColor
                cell.vwTag.backgroundColor = UIColor.themeColorTwo
            } else {
                //unselected view
                cell.vwTag.layer.borderColor = UIColor.systemGray2.cgColor
                cell.vwTag.backgroundColor = UIColor.white
            }
            return cell
        }
        return UITableViewCell()
    }
    
    @objc func tagBtnAction(_ sender: UIButton) {
        if selectedTagIndex.contains(sender.tag) {
            selectedTagIndex.removeAll(where: {$0 == sender.tag})
        } else {
            selectedTagIndex.append(sender.tag)
        }
        tblTags.reloadData()
    }
}

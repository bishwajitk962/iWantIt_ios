//
//  ForumCommentsVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 07/06/24.
//

import UIKit

class ForumCommentsVC: UIViewController {
    @IBOutlet weak var vwTopNav: UIView!
    @IBOutlet weak var tblComments: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialUISetup()
        tblComments.delegate = self
        tblComments.dataSource = self
    }
    @IBAction func backBtnAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func initialUISetup() {
        vwTopNav.layer.cornerRadius = 20
        vwTopNav.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
}

extension ForumCommentsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForumCommentsTVC", for: indexPath) as! ForumCommentsTVC
        return cell
    }
}

//
//  ForumMainVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 06/06/24.
//

import UIKit

class ForumMainVC: UIViewController {
    @IBOutlet weak var tblForums: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblForums.delegate = self
        tblForums.dataSource = self
    }
    @IBAction func commentsBtnAction(_ sender: UIButton) {
        if let forumCommentsVc = self.storyboard?.instantiateViewController(withIdentifier: "ForumCommentsVC") as? ForumCommentsVC {
            self.navigationController?.pushViewController(forumCommentsVc, animated: true)
        }
    }
    @IBAction func hamburgerMenuBtnAction(_ sender: UIButton) {
        
    }
}

extension ForumMainVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForumTVC", for: indexPath) as! ForumTVC
        return cell
    }
}

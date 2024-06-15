//
//  SMSVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 14/06/24.
//

import UIKit

class SMSVC: UIViewController {
    @IBOutlet weak var tblSms: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblSms.delegate = self
        tblSms.dataSource = self
    }
}

extension SMSVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SMSTVC", for: indexPath) as! SMSTVC
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let chatVc = self.storyboard?.instantiateViewController(withIdentifier: "ChatVC") as? ChatVC {
            self.navigationController?.pushViewController(chatVc, animated: true)
        }
    }
}

//
//  ForumTVC.swift
//  iWantIT
//
//  Created by Supriyo Dey on 07/06/24.
//

import UIKit

class ForumTVC: UITableViewCell {
    @IBOutlet weak var vwContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwContainer.layer.shadowColor = UIColor.black.cgColor
        vwContainer.layer.shadowOpacity = 0.2
        vwContainer.layer.shadowRadius = 1
        vwContainer.layer.shadowOffset = CGSize(width: 1, height: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

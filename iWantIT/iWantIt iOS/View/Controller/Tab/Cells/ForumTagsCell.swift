//
//  ForumTagsCell.swift
//  iWantIT
//
//  Created by Supriyo Dey on 13/06/24.
//

import UIKit

class ForumTagsCell: UITableViewCell {
    @IBOutlet weak var vwTag: UIView!
    @IBOutlet weak var lblTag: UILabel!
    @IBOutlet weak var btnTag: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwTag.layer.cornerRadius = 13
        vwTag.layer.borderColor = UIColor.systemGray2.cgColor
        vwTag.backgroundColor = UIColor.white
        vwTag.layer.borderWidth = 1
        vwTag.layer.shadowColor = UIColor.lightGray.cgColor
        vwTag.layer.shadowRadius = 1.5
        vwTag.layer.shadowOffset = CGSize(width: 1, height: 1)
        vwTag.layer.shadowOpacity = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

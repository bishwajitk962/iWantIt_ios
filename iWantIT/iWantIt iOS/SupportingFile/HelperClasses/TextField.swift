//
//  TextField.swift
//  E-Wallet
//
//  Created by Prashant Kumar on 14/02/24.
//

import UIKit
class TextField : UITextField {
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
    
}

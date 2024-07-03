//
//  UIButton+Extension.swift
//  Whetness
//
//  Created by Bishwajit kumar on 12/12/23.
//  Copyright © 2021 Kamaljeet Punia. All rights reserved.
//

import UIKit

extension UIButton {
    func underlineText() {
        guard let text = self.currentTitle,
              let font = self.titleLabel?.font else {
            return
        }
        let attributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.font: font
        ]
        let underlineAttriString = NSAttributedString(string: text,
                                                      attributes: attributes)
        self.setAttributedTitle(underlineAttriString, for: .normal)
    }
}
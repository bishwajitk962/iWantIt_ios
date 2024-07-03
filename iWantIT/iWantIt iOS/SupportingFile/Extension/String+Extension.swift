//
//  String+Extension.swift
//  TimeApp
//
//  Created by Bishwajit kumar on 12/12/23.
//  Copyright © 2020 Tina. All rights reserved.
//

import Foundation

extension String {
    var isEmptyWithTrimmedSpace: Bool {
        return self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

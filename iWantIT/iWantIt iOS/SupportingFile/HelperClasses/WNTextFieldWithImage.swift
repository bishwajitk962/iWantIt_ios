//
//  WNTextFieldWithImage.swift
//  Whetness
//
//  Created by Bishwajit kumar on 12/12/23.
//  Copyright © 2021 Kamaljeet Punia. All rights reserved.
//

import UIKit

class WNTextFieldWithImage: UITextField {
    
    // MARK: - VARIABLES
    private let wnInactiveBorderColor: UIColor? = UIColor(named: "lightBlue")
    private let wnActiveBorderColor: UIColor? = UIColor(named: "ThemeBlue")
    private let wnBorderWidth: CGFloat = 1
    private let wnCornerRadius: CGFloat = 8
    
    private let wnTextColor: UIColor = .white
    private let wnFont: UIFont = AppFont.regular.fontWithSize(12)
    
    private let wnPlaceholderColor: UIColor? = UIColor(named: "BlueGray")
    
    private let leftViewWidth: CGFloat = 15
    private let leftImageSize: CGFloat = 15
    private let leftImage: UIImage? = nil
    
    private let rightViewWidth: CGFloat = 30
    private let rightImageSize: CGFloat = 14
    @IBInspectable var rightImage: UIImage? {
        didSet {
            self.addRightView()
        }
    }
    
    // MARK: - INITIALIZERS
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setupTextField()
    }
    
    // MARK: - PRIVATE FUNCTIONS
    private func setupTextField() {
        self.setFont()
        self.addBorder()
        self.addLeftView()
        self.setPlaceholderColor()
        self.delegate = self
    }
    
    private func setFont() {
        self.textColor = self.wnTextColor
        self.font = self.wnFont
    }
    
    private func setPlaceholderColor() {
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                        attributes: [NSAttributedString.Key.foregroundColor: self.wnPlaceholderColor ?? .lightGray])
    }
    
    private func addBorder() {
        self.layer.borderWidth = self.wnBorderWidth
        self.layer.borderColor = self.wnInactiveBorderColor?.cgColor
        self.layer.cornerRadius = self.wnCornerRadius
    }
    
    private func addLeftView() {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: self.leftViewWidth, height: self.frame.height))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.leftImageSize, height: self.leftImageSize))
        imageView.center = leftView.center
        imageView.image = self.leftImage
        imageView.contentMode = .scaleAspectFit
        leftView.addSubview(imageView)
        self.leftView = leftView
        self.leftViewMode = .always
    }
    
    private func addRightView() {
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: self.rightViewWidth, height: self.frame.height))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.rightImageSize, height: self.rightImageSize))
        imageView.center = rightView.center
        imageView.image = self.rightImage
        imageView.contentMode = .scaleAspectFit
        rightView.addSubview(imageView)
        self.rightView = rightView
        self.rightViewMode = .always
    }
}

// MARK: TEXTFIELD DELEGATE
extension WNTextFieldWithImage: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.layer.borderColor = self.wnActiveBorderColor?.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.layer.borderColor = self.wnInactiveBorderColor?.cgColor
    }
}

//
//  TagCell.swift
//  iWantIT
//
//  Created by Supriyo Dey on 14/06/24.
//
 
import UIKit

class TagCell: UICollectionViewCell {
    static let identifier = "TagCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1.0, green: 0.91, blue: 0.62, alpha: 1.0)
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.25
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.borderColor = UIColor(red: 1.0, green: 0.73, blue: 0.30, alpha: 1.0).cgColor
        view.layer.borderWidth = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(containerView)
        containerView.addSubview(tagLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            tagLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            tagLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5),
            tagLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            tagLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        tagLabel.text = text
    }
}

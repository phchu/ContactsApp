//
//  ContactTableViewCell.swift
//  NewsApp
//
//  Created by phchu on 2020/6/12.
//  Copyright © 2020 phchu. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    var contact:Contact? {
        didSet {
            guard let contactItem = contact else {return}
            if let name = contactItem.name {
                profileImageView.image = UIImage(named: name)
                nameLabel.text = name
            }
            if let jobTitle = contactItem.jobTitle {
                jobTitleDetailedLabel.text = " \(jobTitle) "
            }
            
            if let country = contactItem.country {
                countryImageView.image = UIImage(named: country)
            }
        }
    }
    
    let profileImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // image will never be strecthed vertially or horizontally
        img.translatesAutoresizingMaskIntoConstraints = false // enable autolayout
        img.layer.cornerRadius = 35
        img.clipsToBounds = true
        return img
    }()
    
    let nameLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let jobTitleDetailedLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.backgroundColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let containerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true // this will make sure its children do not go out of the boundary
        return view
    }()
    
    let countryImageView:UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // without this your image will shrink and looks ugly
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setUpView() {
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(countryImageView)
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.heightAnchor.constraint(equalToConstant: 40),
            
            profileImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            jobTitleDetailedLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            jobTitleDetailedLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            jobTitleDetailedLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            
            countryImageView.widthAnchor.constraint(equalToConstant: 26),
            countryImageView.heightAnchor.constraint(equalToConstant: 26),
            countryImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            countryImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

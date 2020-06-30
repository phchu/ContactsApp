//
//  ProfileViewController.swift
//  ContactsApp
//
//  Created by phchu on 2020/6/15.
//  Copyright © 2020 phchu. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    init(_ profile: Contact) {
        super.init(nibName: nil, bundle: nil)
        
        setUpView(profile)
    }
    
  required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    fileprivate func setUpView(_ profile: Contact) {
        super.viewDidLoad()
        let profileView = ProfileView(frame: view.bounds)
        profileView.profile = profile
        view.backgroundColor = .green
        view.addSubview(profileView)
    }

}

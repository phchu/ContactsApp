//
//  ContactsViewController.swift
//  ContactsApp
//
//  Created by phchu on 2020/6/15.
//  Copyright © 2020 phchu. All rights reserved.
//

import UIKit
import Foundation

class ContactsViewController: UIViewController {

    fileprivate lazy var contactsTableView = UITableView()
    
    override func viewDidLoad() {
        setUpView()
        setUpNavigation()
    }
    
    fileprivate func setUpView() {
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        view.backgroundColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        view.addSubview(self.contactsTableView)
        NSLayoutConstraint.activate([
            contactsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contactsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            contactsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            contactsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            contactsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            contactsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setUpNavigation() {
        navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 1, green: 1, blue: 1, alpha: 1)]
    }
}

extension ContactsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //      let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        //      cell.textLabel?.text = contacts[indexPath.row].name
        cell.contact = contactsViewModel[indexPath.row].contact
        return cell
    }
}

extension ContactsViewController: UITableViewDelegate {
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

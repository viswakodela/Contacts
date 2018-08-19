//
//  ContactsViewController.swift
//  Contacts
//
//  Created by Viswa Kodela on 8/18/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class ContactsViewController: UITableViewController, UISearchBarDelegate {
    
    var presenter: ViewToPresenterProtocol?
    
    var contact = [Contact]()
    
    let cellId = "cellId"
    var filteredContacts = [Contact]()
    
    let searchBarController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        
        setupSearchBarandTableView()
    }
    
    
    
    fileprivate func setupSearchBarandTableView() {
        navigationItem.title = "Contacts"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        searchBarController.searchBar.delegate = self
        navigationItem.searchController = searchBarController
        tableView.keyboardDismissMode = .onDrag
        navigationItem.hidesSearchBarWhenScrolling = false
        searchBarController.dimsBackgroundDuringPresentation = false
    }
    
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty{
            filteredContacts = contact
        }
        else {
            filteredContacts = contact.filter({ (contact) -> Bool in
                return contact.firstName.lowercased().contains(searchText.lowercased())
            })
        }
        tableView.reloadData()
    }
}
    

extension ContactsViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredContacts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.numberOfLines = -1
        
        let contacts = filteredContacts[indexPath.row]
        
        cell.textLabel?.text = contacts.firstName
        
        let attributedtext = NSMutableAttributedString(string: contacts.firstName, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        attributedtext.append(NSAttributedString(string: " " + contacts.lastName, attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 18)]))
        attributedtext.append(NSAttributedString(string: "\n"+contacts.phoneNumber, attributes: [NSAttributedStringKey.foregroundColor : UIColor.gray]))
        cell.textLabel?.attributedText = attributedtext
        return cell
    } 
}


extension ContactsViewController: PresenterToViewProtocol {
    func showError() {
        print("Error Fetching the Contacts")
    }
    
    func showContacts(contact: [Contact]) {
        
        self.contact = contact
        self.filteredContacts = self.contact
        tableView.reloadData()
    }
}

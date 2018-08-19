//
//  ContactsInteractor.swift
//  Contact
//
//  Created by Viswa Kodela on 8/18/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit
import Contacts

class ContactsInteractor: PresentorToInterectorProtocol {
    
    var presenter: InterectorToPresenterProtocol?
    
    var filtedContacts = [Contact]()
    
    func fetchContacts() {
        
        let contactsStore = CNContactStore()
        contactsStore.requestAccess(for: .contacts) { (granted, error) in
            if error != nil {
                print("Error retreiving contacts:", error ?? "Something went wrong")
            }
            if granted {
                print("Access Granted")
                ContactsExtension.shared.contactsFetch(contactsStore: contactsStore, completion: { (contact) in
//                    print(contact)
                    self.presenter?.contactFetched(contact: contact)
                })
            }else {
                print("Acces Denied")
            }
        }
    }
}

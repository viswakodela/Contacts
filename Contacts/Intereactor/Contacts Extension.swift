//
//  File.swift
//  Contact
//
//  Created by Viswa Kodela on 8/19/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit
import Contacts

class ContactsExtension {
    
    var contacts = [Contact]()
    
    static let shared = ContactsExtension()
    
    func contactsFetch(contactsStore: CNContactStore, completion: @escaping ([Contact]) -> ()) {
        
        let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey, CNContactImageDataKey]
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        fetchRequest.sortOrder = CNContactSortOrder.givenName
        
        DispatchQueue.main.async {
            do {
                try contactsStore.enumerateContacts(with: fetchRequest, usingBlock: { (contact, unsafePointer) in
//                                          print(contact.givenName + " " + contact.familyName)
                    if let phoneNumber = contact.phoneNumbers.first?.value.stringValue{
                        
                        DispatchQueue.main.async {
                            
                            self.contacts.append(Contact(firstName: contact.givenName, lastName: contact.familyName, phoneNumber: phoneNumber))
                            
                                completion(self.contacts)
                            
                            
//                            print(self.contacts)
//                            let sortedcontacts = self.contacts.sorted(by: { (c1, c2) -> Bool in
//                                c1.firstName < c2.firstName && c1.lastName < c2.lastName
//                            })
                        }
                    }
                })
            }catch {
                print("Error enumerating the Contacts:", error)
            }
        }
    }
    
    
    
}

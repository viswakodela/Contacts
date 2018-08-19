//
//  ContactsModel.swift
//  Contacts
//
//  Created by Viswa Kodela on 8/18/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit
import Contacts

class Contact {
    
    let firstName: String
    let lastName: String
    let phoneNumber: String
    
    init(firstName: String, lastName: String, phoneNumber: String){
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }  
}

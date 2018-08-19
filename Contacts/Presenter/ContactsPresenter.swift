//
//  ContactsPresenter.swift
//  Contact
//
//  Created by Viswa Kodela on 8/18/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class ContactsPresenter: ViewToPresenterProtocol {
    
//    var contact: [Contact]?
    
    var view: PresenterToViewProtocol?
    var interector: PresentorToInterectorProtocol?
    var router: PresenterToRouterProtocol?
    
    func updateView() {
        interector?.fetchContacts()
    }
}

extension ContactsPresenter: InterectorToPresenterProtocol {
    
    func contactFetched(contact: [Contact]) {
        view?.showContacts(contact: contact)
    }
    
    func contactFetchFailed() {
        print("Error Fetching the Contacts")
    }
}

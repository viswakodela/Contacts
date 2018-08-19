//
//  ViewController.swift
//  Contacts
//
//  Created by Viswa Kodela on 8/18/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit
import Foundation

protocol PresenterToViewProtocol: class {
    func showContacts(contact: [Contact]);
    func showError()
}

protocol InterectorToPresenterProtocol: class {
    func contactFetched(contact: [Contact])
    func contactFetchFailed()
}

protocol PresentorToInterectorProtocol: class {
    var presenter: InterectorToPresenterProtocol? {get set}
    func fetchContacts()
}

protocol ViewToPresenterProtocol: class {
    var view: PresenterToViewProtocol? {get set}
    var interector: PresentorToInterectorProtocol? {get set}
    var router: PresenterToRouterProtocol? {get set}
    func updateView()
    
}

protocol PresenterToRouterProtocol: class {
    static func contactModule() -> UIViewController
}



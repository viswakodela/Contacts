//
//  ContactsRouter.swift
//  Contact
//
//  Created by Viswa Kodela on 8/18/18.
//  Copyright © 2018 Viswa Kodela. All rights reserved.
//

import UIKit

class ContactsRouter: PresenterToRouterProtocol {
    
    static func contactModule() -> UIViewController {
        
        let view = ContactsViewController()
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = ContactsPresenter()
        let interactor: PresentorToInterectorProtocol = ContactsInteractor()
        
        view.presenter = presenter
        presenter.view = view 
        presenter.interector = interactor
        interactor.presenter = presenter
        
        return view
    }
    
}

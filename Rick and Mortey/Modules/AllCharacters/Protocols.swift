//
//  Protocols.swift
//  Rick and Mortey
//
//  Created by Igor Sapronov on 23.05.2022.
//

import Foundation

protocol AllCharactersViewPresenterToView: AnyObject {
    
}

protocol AllCharactersViewToPresenter: AnyObject {
    
    func didLoad()
}

protocol AllCharactersViewInteractorToPresenter: AnyObject {
    
}

protocol AllCharactersViewPresenterToInteractor: AnyObject {
    
    func getAllCharacters()
}

protocol AllCharactersViewRouterToPresenter: AnyObject {
    
}

protocol AllCharactersViewPresenterToRouter: AnyObject {
    
}

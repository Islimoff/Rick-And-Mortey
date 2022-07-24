//
//  Protocols.swift
//  Rick and Mortey
//
//  Created by Igor Sapronov on 23.05.2022.
//

import Foundation

protocol AllCharactersPresenterToView: AnyObject {
    
    func reloadData()
}

protocol AllCharactersViewToPresenter: AnyObject {
    
    var view: AllCharactersPresenterToView? { get set }
    
    var characters: [Character] { get }
    
    func didLoad()
}

protocol AllCharactersInteractorToPresenter: AnyObject {
    
    func getAllCharactersWithSuccess(characters: [Character])
}

protocol AllCharactersPresenterToInteractor: AnyObject {
    
    func getAllCharacters()
}

protocol AllCharactersRouterToPresenter: AnyObject {
    
}

protocol AllCharactersPresenterToRouter: AnyObject {
    
}

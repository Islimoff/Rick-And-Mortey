//
//  AllCharactersPresenter.swift
//  Rick and Mortey
//
//  Created by Igor Sapronov on 24.05.2022.
//

import Foundation


class AllCharactersPresenter: AllCharactersViewToPresenter, AllCharactersInteractorToPresenter {
    
    var view: AllCharactersPresenterToView?
    
    var characters = [Character]()
    
    var interactor: AllCharactersPresenterToInteractor?
    
    func didLoad() {
        interactor?.getAllCharacters()
    }
    
    func getAllCharactersWithSuccess(characters: [Character]) {
        self.characters = characters
        view?.reloadData()
    }
}

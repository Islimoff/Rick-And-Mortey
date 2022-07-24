//
//  AllCharactersInteractor.swift
//  Rick and Mortey
//
//  Created by Сапронов Игорь on 24.05.2022.
//

import Foundation

class AllCharactersInteractor: AllCharactersPresenterToInteractor {
    
    weak var presenter: AllCharactersInteractorToPresenter?
    
    let manager = NetworkManager()
    
    func getAllCharacters(){
        
        manager.getDataWithComplition(with: "chafracter", expectedType: CharactersPage.self) {[weak self] reault in
            
            guard let self = self else {return}
            switch reault {
            case .success(let page):
                self.presenter?.getAllCharactersWithSuccess(characters: page.results)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

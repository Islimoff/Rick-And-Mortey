//
//  AllCharactersConfigurator.swift
//  Rick and Mortey
//
//  Created by Сапронов Игорь on 02.06.2022.
//

import Foundation

class AllCharactersConfigurator {

    func configure() -> AllCharactersViewController {
        let view = AllCharactersViewController()
        let presenter = AllCharactersPresenter()
        let interactor = AllCharactersInteractor()
        interactor.presenter = presenter
//        let router = AllCharactersRouter()
//        interactor.presenter = presenter
        view.presenter = presenter
        presenter.interactor = interactor
        presenter.view = view
//        presenter.router = router
//        router.view = view
        return view
    }
}

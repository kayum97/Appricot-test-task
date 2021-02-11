//
//  TopGamesListRouter.swift
//  test-task
//
//  Created by Admin on 11.02.2021.
//

import Foundation

protocol TopGamesListRouterProtocol: class {
    func showError(message: String)
}

class TopGamesListRouter: TopGamesListRouterProtocol {
    private var view: TopGamesListViewProtocol?
    
    init(view: TopGamesListViewProtocol) {
        self.view = view
    }
    
    func showError(message: String) {
        view?.showSimpleAlert(title: "Error", message: message)
    }
}

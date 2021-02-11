//
//  TopGamesListPresenter.swift
//  test-task
//
//  Created by Admin on 09.02.2021.
//

import Foundation

protocol TopGamesListPresenterProtocol: class {
    func viewDidLoad()
}

class TopGamesListPresenter: TopGamesListPresenterProtocol {
    private var view: TopGamesListViewProtocol
    private var interactor: TopGamesListInteractorProtocol
    private var router: TopGamesListRouterProtocol
    
    init(view: TopGamesListViewProtocol, interactor: TopGamesListInteractorProtocol, router: TopGamesListRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.loadData { [weak self] gamesInfo in
            guard let gamesInfo = gamesInfo else {
                self?.router.showError(message: AppError.loadingError.rawValue)
                return
            }
            DispatchQueue.main.async {
                self?.view.updateGamesInfoList(withArray: gamesInfo)
            }
        }
    }
}

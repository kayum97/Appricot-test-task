//
//  TopGamesListInteractor.swift
//  test-task
//
//  Created by Admin on 11.02.2021.
//

import Foundation

protocol TopGamesListInteractorProtocol: class {
    func loadData(completion: @escaping ([TopObject]?) -> Void)
}

class TopGamesListInteractor: TopGamesListInteractorProtocol {
    private var service = API()
    
    func loadData(completion: @escaping ([TopObject]?) -> Void) {
        self.service.loadData(completion: completion)
    }
}

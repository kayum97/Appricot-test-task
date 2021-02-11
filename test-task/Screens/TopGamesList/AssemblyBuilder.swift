//
//  AssemblyBuilder.swift
//  test-task
//
//  Created by Admin on 09.02.2021.
//

import Foundation
import UIKit

class AssemblyBuilder {
    func createTopGamesListScreen() -> UIViewController {
        let topGamesListViewController = TopGamesListViewController()
        let topGamesListInteractor = TopGamesListInteractor()
        let topGamesListRouter = TopGamesListRouter(view: topGamesListViewController)
        let topGamesListPresenter = TopGamesListPresenter(view: topGamesListViewController, interactor: topGamesListInteractor, router: topGamesListRouter)
        
        topGamesListViewController.presenter = topGamesListPresenter
        
        return topGamesListViewController
    }
}

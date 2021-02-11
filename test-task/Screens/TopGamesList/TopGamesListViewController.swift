//
//  TopGamesListViewController.swift
//  test-task
//
//  Created by Admin on 09.02.2021.
//

import UIKit
import SnapKit

protocol TopGamesListViewProtocol: UIViewController {
    func updateGamesInfoList(withArray games: [TopObject])
    func showSimpleAlert(title: String?, message: String?)
}

class TopGamesListViewController: UIViewController {
    
    var presenter: TopGamesListPresenterProtocol?
    
    private var gamesInfoArray: [TopObject] = []
    private let titleScreen = UILabel()
    private let gamesInfoTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        presenter?.viewDidLoad()
        
        configureTitleScreen()
        configureGamesInfoTableView()
    }
    
    private func configureTitleScreen() {
        view.addSubview(titleScreen)
        
        titleScreen.text = "Top Games"
        titleScreen.textAlignment = .center
        titleScreen.font = UIFont.boldSystemFont(ofSize: 20)
        
        titleScreen.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(15)
            make.leading.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func configureGamesInfoTableView() {
        view.addSubview(gamesInfoTableView)
        
        gamesInfoTableView.register(TopGamesListCell.self, forCellReuseIdentifier: TopGamesListCell.identifierForTableView)
        gamesInfoTableView.delegate = self
        gamesInfoTableView.dataSource = self
        
        gamesInfoTableView.rowHeight = 100.0
        gamesInfoTableView.separatorStyle = .none
        
        gamesInfoTableView.snp.makeConstraints { (make) in
            make.top.equalTo(titleScreen.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview().inset(15)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}

extension TopGamesListViewController: TopGamesListViewProtocol {
    func updateGamesInfoList(withArray games: [TopObject]) {
        self.gamesInfoArray = games
        self.gamesInfoTableView.reloadData()
    }
}

extension TopGamesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gamesInfoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TopGamesListCell.identifierForTableView, for: indexPath) as? TopGamesListCell else {
            return UITableViewCell()
        }
        
        cell.updateCell(gameInfo: gamesInfoArray[indexPath.row], rowIndex: indexPath.row + 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

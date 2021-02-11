//
//  TopGamesListCell.swift
//  test-task
//
//  Created by Admin on 09.02.2021.
//

import UIKit
import SnapKit
import Kingfisher

class TopGamesListCell: UITableViewCell {
    static let identifierForTableView = "identifierForTableView"
    
    private let orderLabel = UILabel()
    private let coverGame = UIImageView()
    private let titleGame = UILabel()
    private let channels = UILabel()
    private let channelsImage = UIImageView()
    private let viewers = UILabel()
    private let viewersImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateCell(gameInfo: TopObject?, rowIndex: Int) {
        orderLabel.text = "\(rowIndex)"
        
        guard let gameInfo = gameInfo else { return }
        titleGame.text = gameInfo.game.name
        channels.text = "\(gameInfo.channels)"
        viewers.text = "\(gameInfo.viewers)"
        let url = URL(string: gameInfo.game.logo.medium)
        coverGame.kf.setImage(with: url, options: [.cacheOriginalImage])
    }
    
    private func createUI() {
        contentView.addSubview(orderLabel)
        contentView.addSubview(coverGame)
        contentView.addSubview(titleGame)
        titleGame.numberOfLines = 0
        
        contentView.addSubview(channelsImage)
        channelsImage.image = UIImage(systemName: "speaker")
        channelsImage.tintColor = .black
        contentView.addSubview(channels)
        
        contentView.addSubview(viewersImage)
        viewersImage.image = UIImage(systemName: "person")
        viewersImage.tintColor = .black
        contentView.addSubview(viewers)
    }
    
    private func setupConstraints() {
        orderLabel.snp.makeConstraints({ (make) in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.equalToSuperview().inset(5)
            make.width.equalTo(30)
        })
        
        coverGame.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(5)
            make.leading.equalTo(orderLabel.snp.trailing).offset(10)
            make.width.equalTo(100)
        }
        
        titleGame.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(coverGame.snp.trailing).offset(15)
            make.height.equalTo(50)
        }
        
        channelsImage.snp.makeConstraints { (make) in
            make.top.equalTo(titleGame.snp.bottom).offset(5)
            make.leading.equalTo(coverGame.snp.trailing).offset(15)
            make.width.equalTo(20)
        }
        
        channels.snp.makeConstraints { (make) in
            make.top.equalTo(titleGame.snp.bottom).offset(5)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(channelsImage.snp.trailing).offset(5)
        }
        
        viewersImage.snp.makeConstraints { (make) in
            make.top.equalTo(channels.snp.bottom)
            make.leading.equalTo(coverGame.snp.trailing).offset(15)
            make.width.equalTo(20)
            make.bottom.equalToSuperview().inset(5)
        }
        
        viewers.snp.makeConstraints { (make) in
            make.top.equalTo(channels.snp.bottom)
            make.trailing.equalToSuperview().inset(15)
            make.leading.equalTo(viewersImage.snp.trailing).offset(5)
            make.bottom.equalToSuperview().inset(5)
        }
    }
}

//
//  GameInfoModel.swift
//  test-task
//
//  Created by Admin on 09.02.2021.
//

import Foundation

struct ResponseModel: Codable {
    var top: [TopObject]
}

struct TopObject: Codable {
    var channels: UInt
    var viewers: UInt
    var game: GameInfo
}

struct GameInfo: Codable {
    var name: String
    var logo: Box
}

struct Box: Codable {
    var medium: String
}

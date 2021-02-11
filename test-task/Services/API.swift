//
//  API.swift
//  test-task
//
//  Created by Admin on 09.02.2021.
//

import Foundation
import Alamofire

class API {
    private let baseUrl = "https://api.twitch.tv/kraken/games/top"
    private let parameter = "?limit=100"
    
    func loadData(completion: @escaping ([TopObject]?) -> Void) {
        guard let url = URL(string: baseUrl + parameter) else {
            completion(nil)
            return
        }
        
        let headers: HTTPHeaders = [
            "Client-ID": "sd4grh0omdj9a31exnpikhrmsu3v46",
            "Accept": "application/vnd.twitchtv.v5+json"
        ]
        
        AF.request(url, headers: headers).responseJSON { response in
            if let data = response.data {
                let gamesInfoArray = GamesInfoParser().parseFromJson(data: data)
                completion(gamesInfoArray)
            } else {
                completion(nil)
            }
        }
    }
}

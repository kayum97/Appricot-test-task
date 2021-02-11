//
//  Parser.swift
//  test-task
//
//  Created by Admin on 09.02.2021.
//

import Foundation

class GamesInfoParser {
    func parseFromJson(data: Data) -> [TopObject]? {
        guard let parsedResult: ResponseModel = try? JSONDecoder().decode(ResponseModel.self, from: data) else {
            return nil
        }
        
        return parsedResult.top
    }
}

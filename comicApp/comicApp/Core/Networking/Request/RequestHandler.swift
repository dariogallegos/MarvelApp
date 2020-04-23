//
//  RequestHandler.swift
//  comicApp
//
//  Created by Dario on 22/04/2020.
//  Copyright © 2020 Dario. All rights reserved.
//

import Foundation

class RequestHandler {
    
    private var limit: Int = 30
    private let baseURL = "https://gateway.marvel.com"
    
    func getCharacters(pageNumber: Int = 0) -> URLRequest{
        let endpoint = "/v1/public/characters"
        let url = baseURL + endpoint + buildQueryString(pageNumber: pageNumber, isCharacterList: true)
        print(url)
        let request = URLRequest(url: URL(string: url)!)
        return request
        
    }
    
    func getCharacterDetail(id: Int) -> URLRequest{
        // https://gateway.marvel.com/v1/public/characters/1011334/comics
        let endpoint = "/v1/public/characters/\(id)"
        let url = baseURL + endpoint + buildQueryString()
        
        let request = URLRequest(url: URL(string: url)!)
        return request
        
    }
    
    private func buildQueryString(pageNumber: Int = 0, isCharacterList: Bool = false) -> String{
        let timeStamp = Date().timeIntervalSince1970
        var queryString = "?ts=\(timeStamp)&apikey=\(publicKey)&hash=\(buildHashToken(timestamp: timeStamp))"
        if isCharacterList{
            var pageNumber = pageNumber
            pageNumber = limit * pageNumber
            queryString = queryString + "&limit=\(limit)&offset=\(pageNumber)"
        }
        return queryString
    }
    
    private func buildHashToken(timestamp: TimeInterval) -> String{
        let unhashedString = "\(timestamp)" + privateKey + publicKey
        return MD5(str: unhashedString)
    }
    
}

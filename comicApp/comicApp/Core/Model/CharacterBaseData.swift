//
//  CharacterBase.swift
//  comicApp
//
//  Created by Dario on 22/04/2020.
//  Copyright © 2020 Dario. All rights reserved.
//

import Foundation


struct CharacterBaseData: Codable {
    
    let responseCode: Int?
    let apiDataSource: CharacterDataSource?
    
    enum CodingKeys: String, CodingKey{
        case responseCode = "code"
        case apiDataSource = "data"
    }
}

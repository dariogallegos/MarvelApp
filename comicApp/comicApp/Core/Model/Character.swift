//
//  Character.swift
//  comicApp
//
//  Created by Dario on 22/04/2020.
//  Copyright © 2020 Dario. All rights reserved.
//

import Foundation

struct Character: Codable {
    let id : Int?
    let name : String?
    let description : String?
    let modified : String?
    let thumbnail : Thumbnail?
    let resourceURI : String?
}

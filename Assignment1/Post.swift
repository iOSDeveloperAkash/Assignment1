//
//  Post.swift
//  Assignment1
//
//  Created by admin on 09/08/19.
//  Copyright © 2019 admin. All rights reserved.
//

import Foundation

struct Post :Codable{
    var createdAt : String
    var title : String
    
    enum CodingKeys: String, CodingKey{
        case title
        case createdAt = "created_at"
    }
    
}

struct Hits: Codable {
    var hits: [Post]
    
}


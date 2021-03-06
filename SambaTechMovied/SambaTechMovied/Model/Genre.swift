//
//  Genre.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import Foundation
import ObjectMapper

class Genre: Mappable {

    var id        = 0
    var name      = ""
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id        <- map["id"]
        name      <- map["name"]
    }
}

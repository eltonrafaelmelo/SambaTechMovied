//
//  Trailer.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 03/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ObjectMapper


class Trailer: Mappable {

    var id        = ""
    var iso_639_1 = ""
    var key       = ""
    var name      = ""
    var site      = ""
    var size      = 0
    var type      = ""

    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id        <- map["id"]
        iso_639_1 <- map["iso_639_1"]
        key       <- map["key"]
        name      <- map["name"]
        site      <- map["site"]
        size      <- map["size"]
        type      <- map["type"]
    }
}

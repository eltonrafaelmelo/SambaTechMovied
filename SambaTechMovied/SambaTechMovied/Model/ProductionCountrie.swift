//
//  ProductionCountrie.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import Foundation
import ObjectMapper

class ProductionCountrie: Mappable {

    var iso  = ""
    var name = ""
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        iso   <- map["iso_3166_1"]
        name  <- map["name"]
    }
}

//
//  TOPhoto.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 5/4/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ObjectMapper

class TOPhoto: Mappable {

    var id        = 0
    var backdrops = [Backdrop]()
    var posters   = [Posters]()

    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id         <- map["id"]
        backdrops  <- map["backdrops"]
        posters    <- map["posters"]
    }
}

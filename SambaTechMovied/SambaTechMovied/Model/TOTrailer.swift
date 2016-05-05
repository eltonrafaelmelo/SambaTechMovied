//
//  TOTrailer.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 03/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ObjectMapper


class TOTrailer: Mappable {

    var id = 0
    var trailers = [Trailer]()
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id        <- map["id"]
        trailers  <- map["results"]
    }
}

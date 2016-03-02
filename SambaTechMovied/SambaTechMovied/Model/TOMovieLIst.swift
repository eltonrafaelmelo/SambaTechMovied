//
//  TOMovieLIst.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ObjectMapper


class TOMovieLIst: Mappable {

    var page         = 0
    var results      = [Movie]()
    var totalResults = 0
    var totalPages   = 0
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        page         <- map["page"]
        results      <- map["results"]
        totalResults <- map["total_results"]
        totalPages   <- map["total_pages"]
    }
}

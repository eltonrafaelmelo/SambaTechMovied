//
//  Posters.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 5/4/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ObjectMapper

class Posters: Mappable {

    var aspectRatio = 0.0
    var filePath    = ""
    var height      = 0
    var iso_639_1   = ""
    var voteAverage = 0.0
    var voteCount   = 0
    var width       = 0
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        aspectRatio <- map["aspect_ratio"]
        filePath    <- map["file_path"]
        height      <- map["height"]
        iso_639_1   <- map["iso_639_1"]
        voteAverage <- map["vote_average"]
        voteCount   <- map["vote_count"]
        width       <- map["width"]
    }
    
}

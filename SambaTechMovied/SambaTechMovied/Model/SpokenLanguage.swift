//
//  SpokenLanguage.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ObjectMapper

class SpokenLanguage: Mappable {
    
    var iso  = ""
    var name = ""

    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        iso   <- map["iso_639_1"]
        name  <- map["name"]
    }
}

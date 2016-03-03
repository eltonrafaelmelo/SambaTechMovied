//
//  Images.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import Foundation
import ObjectMapper


class Images: Mappable {

    var baseUrl       = ""
    var secureBaseUrl = ""
    var backdropSizes = [String]()
    var logoSizes     = [String]()
    var posterSizes   = [String]()
    var profileSizes  = [String]()
    var stillSizes    = [String]()

    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        baseUrl       <- map["base_url"]
        secureBaseUrl <- map["secure_base_url"]
        backdropSizes <- map["backdrop_sizes"]
        logoSizes     <- map["logo_sizes"]
        posterSizes   <- map["poster_sizes"]
        profileSizes  <- map["profile_sizes"]
        stillSizes    <- map["still_sizes"]
    }
    
}

//
//  Settings.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ObjectMapper


class Settings: Mappable {
    
    var images     = Images()
    var changeKeys = [String]()

    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        images     <- map["images"]
        changeKeys <- map["change_keys"]
    }

}

//
//  FactoryStoryboard.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 02/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit

class FactoryStoryboard: NSObject {

    class func storyboardMain() -> UIStoryboard {
        
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func storyboardMovie() -> UIStoryboard {
        
        return UIStoryboard(name: "Movie", bundle: nil)
    }
}

//
//  UtilNetwork.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 03/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ReachabilitySwift

class UtilNetwork: NSObject {

    class func isNetworkAvailable() -> Bool {
        
        let reachability: Reachability
        do {
            reachability = try Reachability.reachabilityForInternetConnection()
            return reachability.isReachable()
        } catch {
        }
        
        return false
    }
}

//
//  RestMovie.swift
//  SambaTechMovied
//
//  Created by Paulo nonaka on 3/2/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient {
    
    class func getUsers(completionHandler: (result: Response<TOMovieLIst, NSError>) -> Void ){
        let url = "http://api.themoviedb.org/3/discover/movie?api_key=a573db5e752a82b043ab78deb9ab2a2b&sort_by=popularity.desc"
        Alamofire.request(.GET, url, parameters: nil)
            .responseObject() { (response: Response<TOMovieLIst, NSError>) in
                completionHandler(result: response)
        }
    }
    
  
}
//
//  Movie.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie: Mappable {

     var posterPath       = ""
     var adult            = false
     var overview         = ""
     var releaseDate      = ""
     var genreIds         = [Int]()
     var idMovie          = 0
     var originalTitle    = ""
     var originalLanguage = ""
     var title            = ""
     var backdropPath     = ""
     var popularity       = 0.0
     var voteCount        = 0
     var video            = false
     var voteAverage      = 0.0
    
    required  convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        posterPath         <- map["poster_path"]
        adult              <- map["adult"]
        overview           <- map["overview"]
        releaseDate        <- map["release_date"]
        genreIds           <- map["genre_ids"]
        idMovie            <- map["id"]
        originalTitle      <- map["original_title"]
        originalLanguage   <- map["original_language"]
        title              <- map["title"]
        backdropPath       <- map["backdrop_path"]
        popularity         <- map["popularity"]
        voteCount          <- map["vote_count"]
        video              <- map["video"]
        voteAverage        <- map["vote_average"]
    }
}

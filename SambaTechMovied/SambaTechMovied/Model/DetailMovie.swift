//
//  DetailMovie.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import Foundation
import ObjectMapper

class DetailMovie: Mappable {

    var adult                = false
    var backdropPath         = ""
    var belongsToCollection  = ""
    var budget               = 0
    var genres               = [Genre]()
    var homepage             = ""
    var idDetailMovie        = 0
    var imdbId               = 0
    var originalLanguage     = ""
    var originalTitle        = ""
    var overview             = ""
    var popularity           = 0.0
    var posterPath           = ""
    var productionCompanies  = [ProductionCompanie]()
    var productionCountries  = [ProductionCountrie]()
    var releaseDate          = ""
    var revenue              = 0
    var runtime              = 0
    var spokenLanguages      = [SpokenLanguage]()
    var status               = ""
    var tagline              = ""
    var title                = ""
    var video                = false
    var voteAverage          = 0
    var voteCount            = 0

    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        adult               <- map["adult"]
        backdropPath        <- map["backdrop_path"]
        belongsToCollection <- map["belongs_to_collection"]
        budget              <- map["budget"]
        genres              <- map["genres"]
        homepage            <- map["homepage"]
        idDetailMovie       <- map["id"]
        imdbId              <- map["imdb_id"]
        originalLanguage    <- map["original_language"]
        originalTitle       <- map["original_title"]
        overview            <- map["overview"]
        popularity          <- map["popularity"]
        posterPath          <- map["poster_path"]
        productionCompanies <- map["production_companies"]
        productionCountries <- map["production_countries"]
        releaseDate         <- map["release_date"]
        revenue             <- map["revenue"]
        runtime             <- map["runtime"]
        spokenLanguages     <- map["spoken_languages"]
        status              <- map["status"]
        tagline             <- map["tagline"]
        title               <- map["title"]
        video               <- map["video"]
        voteAverage         <- map["vote_average"]
        voteCount           <- map["vote_count"]
    }
}

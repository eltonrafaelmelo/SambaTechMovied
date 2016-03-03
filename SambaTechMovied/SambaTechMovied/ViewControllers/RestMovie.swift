
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient {
    
    class func getListMovie(completionHandler: (movie: TOMovieLIst?, error: ErrorType?) -> () ){

        let urlFinal = "http://api.themoviedb.org/3/discover/movie?api_key=a573db5e752a82b043ab78deb9ab2a2b&sort_by=popularity.desc"
        Alamofire.request(.GET, urlFinal, parameters: nil)
            .responseObject { (response: TOMovieLIst?, error: ErrorType?) in
                completionHandler(movie: response as TOMovieLIst?, error: error)
        }
    }
    
    class func getDetailMovie(codMovie :Int, completionHandler: (movie: DetailMovie?, error: ErrorType?) -> () ){

        let urlFinal = "https://api.themoviedb.org/3/movie/\(codMovie)?api_key=a573db5e752a82b043ab78deb9ab2a2b"
        Alamofire.request(.GET, urlFinal, parameters: nil)
            .responseObject { (response: DetailMovie?, error: ErrorType?) in
                completionHandler(movie: response as DetailMovie?, error: error)
        }
    }
    
    class func getSetting(completionHandler: (movie: Settings?, error: ErrorType?) -> () ){
        let urlFinal = "http://api.themoviedb.org/3/configuration?api_key=a573db5e752a82b043ab78deb9ab2a2b"
        Alamofire.request(.GET, urlFinal, parameters: nil)
            .responseObject { (response: Settings?, error: ErrorType?) in
                completionHandler(movie: response as Settings?, error: error)
        }
    }
    
    class func getMovie(completionHandler: (movie: TOMovieLIst?, error: ErrorType?) -> () ){
        
        let urlFinal = "http://api.themoviedb.org/3/discover/movie?api_key=a573db5e752a82b043ab78deb9ab2a2b&sort_by=popularity.desc"
        
        
        Alamofire.request(.GET, urlFinal, parameters: nil)
            .responseObject { (response: TOMovieLIst?, error: ErrorType?) in
                completionHandler(movie: response as TOMovieLIst?, error: error)
        }
    }
    
    
}
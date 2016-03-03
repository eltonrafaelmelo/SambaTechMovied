
import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class RestClient {
    
    class func getListMovie(completionHandler: (result: Response<TOMovieLIst, NSError>) -> Void ){
        let url = "http://api.themoviedb.org/3/discover/movie?api_key=a573db5e752a82b043ab78deb9ab2a2b&sort_by=popularity.desc"
//        Alamofire.request(.GET, url, parameters: nil)
//            .responseObject() { (response: Response<TOMovieLIst, NSError>) in
//                completionHandler(result: response)
//        }
    }
    
    class func getDetailMovie(completionHandler: (result: Response<Movie, NSError>) -> Void ){
        let url = "https://api.themoviedb.org/3/movie/550?api_key=a573db5e752a82b043ab78deb9ab2a2b"
//        Alamofire.request(.GET, url, parameters: nil)
//            .responseObject() { (response: Response<Movie, NSError>) in
//                completionHandler(result: response)
//        }
    }
    
    class func getSetting(completionHandler: (result: Response<Settings, NSError>) -> Void ){
        let url = "http://api.themoviedb.org/3/configuration?api_key=a573db5e752a82b043ab78deb9ab2a2b"
//        Alamofire.request(.GET, url, parameters: nil)
//            .responseObject() { (response: Response<Settings, NSError>) in
//                completionHandler(result: response)
//        }
    }
    
    class func getMovie(completionHandler: (movie: TOMovieLIst?, error: ErrorType?) -> () ){
        
        let urlFinal = "http://api.themoviedb.org/3/discover/movie?api_key=a573db5e752a82b043ab78deb9ab2a2b&sort_by=popularity.desc"
        
        
        Alamofire.request(.GET, urlFinal, parameters: nil)
            .responseObject { (response: TOMovieLIst?, error: ErrorType?) in
                completionHandler(movie: response as TOMovieLIst?, error: error)
        }
    }
    
    
}
//
//  Util.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 02/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import SwiftLoader


class Util: NSObject {
    
    static let sharedInstance = Util()
    
    func showActivityIndicator(){
        showActivityIndicator("Carregando...")
    }
    
    func showActivityIndicator(title: String, color: UIColor = UIColor.whiteColor()){
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 120
        config.backgroundColor = UIColor.whiteColor()
        config.spinnerColor = UIColor.grayColor()
        config.titleTextColor = UIColor.grayColor()
        config.spinnerLineWidth = 2.0
        config.cornerRadius =  30
        config.foregroundColor = UIColor.blackColor()
        config.foregroundAlpha = 0.6
        SwiftLoader.setConfig(config)
        SwiftLoader.show(title: title, animated: true)
    }
    
    func hideActivityIndicator(){
        SwiftLoader.hide()
    }
    
    func showMessage(viewController: UIViewController, message: String) {
        let alert = UIAlertController(title: "Samba Tech", message: "\(message)", preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default) { _ in })
        viewController.presentViewController(alert, animated: true){}
    }
    
    func dateMovie(movieDate :String) -> String {
        let toArray = movieDate.componentsSeparatedByString("-")
        var newDate = ""
        if (toArray.count > 2) {
            let day = toArray[2]
            let month = toArray[1]
            let year = toArray[0]
            newDate = "\(day)/\(month)/\(year)"
        }
        
        return newDate
    }
    
    func genresMovie(genres :[Genre]) -> String{
        
        let genre = NSMutableString()
        
        for ge in genres {
            
            let last = genres.last

            genre.appendString(ge.name)
            
            if ge.name != last?.name {
            
                genre.appendString(" | ")

            }
            
        }
        
        return genre as String
        
    }
    
    func returnlanguages(languages :[SpokenLanguage]) -> String{
        
        let newLanguages = NSMutableString()
        
        for lan in languages {
            
            newLanguages.appendString(lan.name)
            
            let last = languages.last
            
            if lan.name != last?.name {
                
                newLanguages.appendString(" | ")

            }
            
        }
        
        return newLanguages as String
        
    }
    
}

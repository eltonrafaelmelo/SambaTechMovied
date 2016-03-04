//
//  cellCategory.swift
//  Socio Master
//
//  Created by Paulo nonaka on 8/3/15.
//  Copyright (c) 2015 DevsUp. All rights reserved.
//

import UIKit
import KFSwiftImageLoader

class cellCategory: UICollectionViewCell {
    
    var indicatoOfActivity:UIActivityIndicatorView?

    @IBOutlet weak var imageMovie: UIImageView!
    var movieReceive = Movie()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        showActivityIndicator()
        
        let urlImage = "http://image.tmdb.org/t/p/w500\(movieReceive.posterPath)"
        
        self.showActivityIndicator()
        
        imageMovie.loadImageFromURLString(urlImage, placeholderImage: UIImage(named: "KiavashFaisali")) {
            (finished, error) in
            self.hideActivityIndicator()
            if (!finished) {
                NSLog("\(error)")
            }
        }

    }
    
    func receiveCategory (movie: Movie){
        self.movieReceive = movie
    }
    
    //MARK: - Activity Indicator
    func showActivityIndicator(){
        if self.indicatoOfActivity == nil{
            self.indicatoOfActivity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
            self.imageMovie.addSubview(self.indicatoOfActivity!)
            self.indicatoOfActivity?.center = self.imageMovie.center
            self.indicatoOfActivity?.startAnimating()
        }
    }
    
    func hideActivityIndicator(){
        self.indicatoOfActivity?.stopAnimating()
        self.indicatoOfActivity?.removeFromSuperview()
        self.indicatoOfActivity = nil
    }
}


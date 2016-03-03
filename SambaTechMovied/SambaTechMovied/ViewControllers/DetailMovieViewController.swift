//
//  DetailMovieViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 02/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import KFSwiftImageLoader


class DetailMovieViewController: UIViewController {
    
    var detailMovie = DetailMovie()

    @IBOutlet weak var labelRun: UILabel!
    @IBOutlet weak var labelAno: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var labelMinutos: UILabel!
    @IBOutlet weak var labelDescri: UITextView!
    @IBOutlet weak var labelGenero: UILabel!
    var indicatoOfActivity:UIActivityIndicatorView?
    var util = Util.sharedInstance
    
    @IBOutlet weak var labelLanguages: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = detailMovie.title
        
        setValueInfo()
        
        let urlImage = "http://image.tmdb.org/t/p/w500\(detailMovie.posterPath)"

        image.loadImageFromURLString(urlImage, placeholderImage: UIImage(named: "KiavashFaisali")) {
            (finished, error) in
            self.hideActivityIndicator()
            if (!finished) {
                NSLog("\(error)")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setValueInfo(){
        labelAno.text = util.dateMovie(detailMovie.releaseDate)
        labelRun.text = detailMovie.status
        labelMinutos.text = "\(detailMovie.runtime) minutos"
        labelDescri.text = detailMovie.overview
        labelGenero.text = util.genresMovie(detailMovie.genres)
        labelLanguages.text = util.returnlanguages(detailMovie.spokenLanguages)
    }
    
    //MARK: - Activity Indicator
    func showActivityIndicator(){
        if self.indicatoOfActivity == nil{
            self.indicatoOfActivity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.Gray)
            self.image.addSubview(self.indicatoOfActivity!)
            self.indicatoOfActivity?.center = self.image.center
            self.indicatoOfActivity?.startAnimating()
        }
    }
    
    func hideActivityIndicator(){
        self.indicatoOfActivity?.stopAnimating()
        self.indicatoOfActivity?.removeFromSuperview()
        self.indicatoOfActivity = nil
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

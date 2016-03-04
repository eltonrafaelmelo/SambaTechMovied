//
//  DetailMovieViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 02/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import KFSwiftImageLoader
//
//  ViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import JLToast

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
    
    @IBOutlet weak var labelTitleIdioma: UILabel!
    @IBOutlet weak var labelLanguages: UILabel!
    @IBOutlet weak var labelTitleGenero: UILabel!
    @IBOutlet weak var labelTitleResumo: UILabel!
    var trailerTable = TrailerTableViewController()
    var toTrailer = TOTrailer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = detailMovie.title
        
        getTrailher()
        
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
        
        labelAno.font = UtilFont.fontTextNormal()
        labelRun.font = UtilFont.fontTextNormal()
        labelMinutos.font = UtilFont.fontTextNormal()
        labelDescri.font = UtilFont.fontTextNormal()
        labelGenero.font = UtilFont.fontTextNormal()
        labelLanguages.font = UtilFont.fontTextNormal()
        labelTitleGenero.font = UtilFont.fontTextNormal()
        labelTitleIdioma.font = UtilFont.fontTextNormal()
        labelTitleResumo.font = UtilFont.fontTextNormal()
        
        
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
    
    
    func getTrailher() {
        
        if UtilNetwork.isNetworkAvailable() {
            
            util.showActivityIndicator()
            
            RestClient.getTrailer(detailMovie.idDetailMovie) {toTrailer, error in
                
                self.util.hideActivityIndicator()
                
                if let _ = error {
                    
                    self.util.showMessage(self, message: "\(error)")
                    
                } else {
                    
                    self.toTrailer = toTrailer!
                    
                }
            }
            
        } else {
            
            JLToast.makeText("No memento você está sem internet. Tente novamente quando tiver conexão.").show()
            
        }
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

//    }
    
    @IBAction func touchButtonTrailes(sender: AnyObject) {
        
        if toTrailer.trailers.count > 0 {
            
            let screen = FactoryStoryboard.storyboardMovie().instantiateViewControllerWithIdentifier("TrailerTableViewController") as! TrailerTableViewController
            screen.toTrailer = toTrailer
            
            navigationController?.pushViewController(screen, animated: true)
            
        } else {
            
            JLToast.makeText("Esse filme não tem trailer").show()

        }
        
       
    }
    
}

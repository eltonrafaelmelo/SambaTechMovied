//
//  ViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionMovie: UICollectionView!
    var toListMovie = TOMovieLIst()
    var util = Util.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SambaTech"
        collectionMovie.delegate = self
        collectionMovie.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getUsers()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getUsers() {
        
        util.showActivityIndicator()
        
        RestClient.getMovie() {movie, error in
            
            self.util.hideActivityIndicator()
            
            if let _ = error {
                
                self.util.showMessage(self, message: "\(error)")
                
            } else {
                
                self.toListMovie = movie!
                
                self.reloadCollection()
              
            }
        }
    }
    
    func reloadCollection(){
        collectionMovie.reloadData()
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
                let movie = toListMovie.results[indexPath.row]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCollectionViewCell", forIndexPath: indexPath) as! cellCategory
                cell.receiveCategory(movie)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toListMovie.results.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let movie = toListMovie.results[indexPath.row]
        getDetailMovie(movie.idMovie)
    }
    
    func jsonString(){
        var text:String = "This is some text " +
        "over multiple lines"
    }
    
    func callScreenDetail(detailMovie :DetailMovie){
        
        let screen = FactoryStoryboard.storyboardMovie().instantiateViewControllerWithIdentifier("detail") as! DetailMovieViewController
        screen.detailMovie = detailMovie
        
        navigationController?.pushViewController(screen, animated: true)
    }
    
    func getDetailMovie(codMovie :Int){
        
        util.showActivityIndicator()

        RestClient.getDetailMovie(codMovie) {movie, error in
            
            self.util.hideActivityIndicator()

            if let _ = error {
                
                self.util.showMessage(self, message: "\(error)")
                
            } else {
                
                self.callScreenDetail(movie!)
                
            }
        }
    }
}


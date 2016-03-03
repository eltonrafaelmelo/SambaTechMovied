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
        
        RestClient.getMovie() {movie, error in
            
//            UtilViewController.hideActivityIndicator()
            
            if let _ = error {
                
//                UtilViewController.showMessage(self, message: "ERROR_OCCURED".localizedWithComment("Um erro ocorreu. Por favor tente novamente :("))
                
            } else {
                
                self.toListMovie = movie!
                
                self.reloadCollection()
                
//                if movie?.response == Constants.Model.MOVIE_RESPONSE_ERROR {
//                    
//                    UtilViewController.showMessage(self, message: movie!.error)
//                    
//                }else{
//                    
//                    self.callScreenDetail(movie!)
//                    
//                }
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
        //        cell.backgroundColor = UIColor.whiteColor()
                cell.receiveCategory(movie)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toListMovie.results.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        callScreenDetail()
    }
    
    func jsonString(){
        var text:String = "This is some text " +
        "over multiple lines"
    }
    
    func callScreenDetail(){
        
        let screen = FactoryStoryboard.storyboardMovie().instantiateViewControllerWithIdentifier("detail") as! DetailMovieViewController
        
        navigationController?.pushViewController(screen, animated: true)
    }
}


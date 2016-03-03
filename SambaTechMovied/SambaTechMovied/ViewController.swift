//
//  ViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionMovie: UICollectionView!
    var toListMovie = TOMovieLIst()
    var util = Util.sharedInstance
    var list = [Movie]()
    let listFiltro = ["Mais populares", "Melhor avaliado"]

    
    @IBOutlet var buttonFiltro: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SambaTech"
        self.navigationItem.rightBarButtonItem = buttonFiltro

        collectionMovie.delegate = self
        collectionMovie.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getUsers()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func touchButtonFiltro(sender: AnyObject) {
        ActionSheetStringPicker.showPickerWithTitle("Ordenar", rows: self.listFiltro, initialSelection: 0, doneBlock: {
            picker, index, value in
            
            self.filtroFilmes(value as! String)
            
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    func filtroFilmes(filtro :String) {
        
        let listT = self.toListMovie.results

        if filtro == "Mais populares" {
            self.list = listT.sort({$0.popularity < $1.popularity})

        } else {
            
            self.list = listT.sort({$0.voteAverage > $1.voteAverage})

        }
        
        self.reloadCollection()

    }
    
    func getUsers() {
        
        util.showActivityIndicator()
        
        RestClient.getMovie() {movie, error in
            
            self.util.hideActivityIndicator()
            
            if let _ = error {
                
                self.util.showMessage(self, message: "\(error)")
                
            } else {
                
                self.toListMovie = movie!
                
                let listT = self.toListMovie.results
                
                //MAIS POPULAR
//                self.list = listT.sort({$0.popularity < $1.popularity})
                
                //MELHO VOTADO
                self.list = listT.sort({$0.voteAverage > $1.voteAverage})
                
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
                let movie = list[indexPath.row]
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MovieCollectionViewCell", forIndexPath: indexPath) as! cellCategory
                cell.receiveCategory(movie)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let movie = list[indexPath.row]
        getDetailMovie(movie.idMovie)
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


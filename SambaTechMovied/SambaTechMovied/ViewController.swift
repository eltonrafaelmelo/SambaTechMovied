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

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionMovie: UICollectionView!
    var toListMovie = TOMovieLIst()
    var util = Util.sharedInstance
    var list = [Movie]()
    let listFiltro = ["Mais populares", "Melhor avaliado"]
    var filter = "Mais populares"
    
    @IBOutlet var buttonFiltro: UIBarButtonItem!
    @IBOutlet var buttonUpdate: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SambaTech"
        self.navigationItem.rightBarButtonItems = [buttonFiltro, buttonUpdate]

        collectionMovie.delegate = self
        collectionMovie.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        getMovie()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func touchButtonUpdate(sender: AnyObject) {
        
        if UtilNetwork.isNetworkAvailable() {
            
            getMovie()

        } else {
            
            JLToast.makeText("No memento você está sem internet. Tente novamente quando tiver conexão.").show()

        }

    }
    
    @IBAction func touchButtonFiltro(sender: AnyObject) {
        ActionSheetStringPicker.showPickerWithTitle("Ordenar", rows: self.listFiltro, initialSelection: 0, doneBlock: {
            picker, index, value in
            
            self.filtroFilmes(value as! String)
            
            return
            }, cancelBlock: { ActionStringCancelBlock in return }, origin: sender)
    }
    
    func filtroFilmes(filtro :String) {
        
        filter = filtro
        
        let listT = self.toListMovie.results
        
        util.showActivityIndicator()

        if filter == "Mais populares" {
            self.list = listT.sort({$0.popularity < $1.popularity})

        } else {
            
            self.list = listT.sort({$0.voteAverage > $1.voteAverage})

        }
        
        self.util.hideActivityIndicator()

        self.reloadCollection()

    }
    
    func getMovie() {
        
        if UtilNetwork.isNetworkAvailable() {
            
            util.showActivityIndicator()
            
            RestClient.getListMovie() {movie, error in
                
                self.util.hideActivityIndicator()
                
                if let _ = error {
                    
                    self.util.showMessage(self, message: "\(error)")
                    
                } else {
                    
                    self.toListMovie = movie!
                    
                    let listT = self.toListMovie.results
                    
                    if self.filter == "Mais populares" {
                        self.list = listT.sort({$0.popularity < $1.popularity})
                        
                    } else {
                        
                        self.list = listT.sort({$0.voteAverage > $1.voteAverage})
                        
                    }
                    
                    self.reloadCollection()
                    
                }
            }
            
        } else {
            
            JLToast.makeText("No memento você está sem internet. Tente novamente quando tiver conexão.").show()

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
        
        if UtilNetwork.isNetworkAvailable() {
            
            util.showActivityIndicator()
            
            RestClient.getDetailMovie(codMovie) {movie, error in
                
                self.util.hideActivityIndicator()
                
                if let _ = error {
                    
                    self.util.showMessage(self, message: "\(error)")
                    
                } else {
                    
                    self.callScreenDetail(movie!)
                    
                }
            }
            
        } else {
            
            JLToast.makeText("No memento você está sem internet. Tente novamente quando tiver conexão.").show()

        }
       
    }
    
    
}


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
    let listFiltro = ["Mais populares", "Melhor avaliado", "Data de lançamento"]
    var filter = "Mais populares"
    var contadorPagina = 0
    var movieLast = Movie()
    
    @IBOutlet var buttonFiltro: UIBarButtonItem!
    @IBOutlet var buttonUpdate: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SambaTech"
        self.navigationItem.rightBarButtonItems = [buttonFiltro, buttonUpdate]

        collectionMovie.delegate = self
        collectionMovie.dataSource = self
        getMovie()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func touchButtonUpdate(sender: AnyObject) {
        
        if UtilNetwork.isNetworkAvailable() {
            
            self.contadorPagina = 0
            
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
                
        util.showActivityIndicator()

        if filter == "Mais populares" {
            
            self.list = list.sort({$0.popularity < $1.popularity})

        } else if filtro == "Melhor avaliado"{
            
            self.list = list.sort({$0.voteAverage > $1.voteAverage})

        } else {
            
            self.list = list.sort({ $0.getDateMovie().compare($1.getDateMovie()) == NSComparisonResult.OrderedDescending })

        }
        
        self.movieLast = self.list.last!
        
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
                        
                    } else if self.filter == "Melhor avaliado"{
                        
                        self.list = listT.sort({$0.voteAverage > $1.voteAverage})
                        
                    } else {
                        
                        self.list = listT.sort({ $0.getDateMovie().compare($1.getDateMovie()) == NSComparisonResult.OrderedDescending })
                        
                    }
                    
                    self.contadorPagina = movie!.page + 1
                    
                    self.movieLast = self.list.last!
                    
                    self.reloadCollection()
                    
                }
            }
            
        } else {
            
            JLToast.makeText("No memento você está sem internet. Tente novamente quando tiver conexão.").show()

        }
       
    }
    
    func getMoviePage() {
        
        if UtilNetwork.isNetworkAvailable() {
            
            util.showActivityIndicator()
            
            RestClient.getListMoviePage(contadorPagina) {movie, error in
                
                self.util.hideActivityIndicator()
                
                if let _ = error {
                    
                    self.util.showMessage(self, message: "\(error)")
                    
                } else {
                    
                    self.toListMovie = movie!
                    
                    let listT = self.toListMovie.results
                    
                    self.contadorPagina = movie!.page + 1
                    
                    self.addMoreMovie(listT)
                    
                }
            }
            
        } else {
            
            JLToast.makeText("No memento você está sem internet. Tente novamente quando tiver conexão.").show()
            
        }
        
    }
    
    func addMoreMovie(listMovies :[Movie]) {
        
        for moviewReceive in listMovies {
            
            list.append(moviewReceive)
        }
        
        if self.filter == "Mais populares" {
            
            self.list = list.sort({$0.popularity < $1.popularity})
            
        } else if self.filter == "Melhor avaliado"{
            
            self.list = list.sort({$0.voteAverage > $1.voteAverage})
            
        } else {
            
            self.list = list.sort({ $0.getDateMovie().compare($1.getDateMovie()) == NSComparisonResult.OrderedDescending })
            
        }
        
        print("\(list.count)")
        
        self.movieLast = self.list.last!
        
        self.reloadCollection()
        
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
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        
        let movie = list[indexPath.row]
        
        if contadorPagina != toListMovie.totalPages {
            
            if movie.title == movieLast.title {
                print("Ultimo filme da lista: \(movie.title)")
                getMoviePage()
            }
        }
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


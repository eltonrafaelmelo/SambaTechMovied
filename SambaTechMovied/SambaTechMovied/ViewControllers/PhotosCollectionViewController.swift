//
//  PhotosCollectionViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 5/9/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit
import SKPhotoBrowser

private let reuseIdentifier = "Cell"

class PhotosCollectionViewController: UICollectionViewController {
    
    private final let screenBound = UIScreen.mainScreen().bounds
    private var screenWidth: CGFloat { return screenBound.size.width }
    private var screenHeight: CGFloat { return screenBound.size.height }
    var images = [SKPhotoProtocol]()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCellWithReuseIdentifier("exampleCollectionViewCell", forIndexPath: indexPath) as? ExampleCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.exampleImageView.image = images[indexPath.row].underlyingImage
        return cell
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if UIDevice.currentDevice().userInterfaceIdiom == .Pad {
            return CGSize(width: screenWidth/2 - 5, height: 300)
        } else {
            return CGSize(width: screenWidth/2 - 5, height: 200)
        }
    }
    
//    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        guard let cell = collectionView.cellForItemAtIndexPath(indexPath) as? ExampleCollectionViewCell else {
//            return
//        }
//        guard let originImage = cell.exampleImageView.image else {
//            return
//        }
//        let browser = SKPhotoBrowser(originImage: originImage, photos: images as [AnyObject], animatedFromView: cell)
//        browser.initializePageIndex(indexPath.row)
//        browser.delegate = self
//        browser.displayDeleteButton = true
//        browser.statusBarStyle = .LightContent
//        browser.bounceAnimation = true
//        
//        // Can hide the action button by setting to false
//        browser.displayAction = true
//        
//        // delete action(you must write `removePhoto` delegate, what resource you want to delete)
//        // browser.displayDeleteButton = true
//        
//        // Optional action button titles (if left off, it uses activity controller
//        // browser.actionButtonTitles = ["Do One Action", "Do Another Action"]
//        
//        presentViewController(browser, animated: true, completion: {})
//    }


}

class ExampleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var exampleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        exampleImageView.image = nil
        layer.cornerRadius = 25.0
        layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        exampleImageView.image = nil
    }
}

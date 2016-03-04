//
//  TrailerTableViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 03/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit

class TrailerTableViewController: UITableViewController {
    
    var toTrailer = TOTrailer()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trailers"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toTrailer.trailers.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TrailerTableViewCell", forIndexPath: indexPath) as! TrailerTableViewCell
        
        let title = indexPath.row + 1
        
        cell.labelTitle.text = "Trailer \(title)"

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let traile = toTrailer.trailers[indexPath.row]
        
        if openYoutube(traile.key) {
            
            let url = NSURL (string: "youtube://\(traile.key)")
            
            UIApplication.sharedApplication().openURL(url!)

        } else {
            
            let screen = FactoryStoryboard.storyboardMovie().instantiateViewControllerWithIdentifier("TrailherWebViewViewController") as! TrailherWebViewViewController
            screen.trailer = traile
            
            navigationController?.pushViewController(screen, animated: true)
        }
       
    }
    
    func openYoutube(key :String) -> Bool {
        let url = NSURL (string: "youtube://\(key)")
        
        let temApp = UIApplication.sharedApplication().canOpenURL(url!)
        
        return temApp
    }


}

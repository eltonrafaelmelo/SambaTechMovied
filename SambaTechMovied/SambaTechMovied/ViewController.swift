//
//  ViewController.swift
//  SambaTechMovied
//
//  Created by Elton Melo on 01/03/16.
//  Copyright © 2016 SambaTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getUsers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func getUsers() {
        
            RestClient.getUsers() { result in
//                self.utilViewController.hideActivityIndicator()
                if result.result.isFailure {
//                    self.utilViewController.showMessage(self, message:"An error occurred. Please try again :(")
                } else {
                    var users = TOMovieLIst()
                    users = result.result.value! as TOMovieLIst

//                    self.tableView.reloadData()
                }
            }
        }
}


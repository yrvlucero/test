//
//  ViewController.swift
//  test
//
//  Created by Yngwie Reigh Vincent Lucero on 23/2/18.
//

import UIKit

class ViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Api().getData().success { (object) in
            print(object.rows.count)
            }.failure { (err) in
                print("ERROR", err.localizedDescription)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


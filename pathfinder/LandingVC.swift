//
//  LandingVC.swift
//  pathfinder
//
//  Created by Adrian Padua on 1/15/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class LandingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createBtnPressed(sender: AnyObject) {
        
        performSegueWithIdentifier("goToClassSelect", sender: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

}

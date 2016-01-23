//
//  ClassSelectVC.swift
//  pathfinder
//
//  Created by Adrian Padua on 1/15/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class ClassSelectVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navBar: UINavigationBar!
    
    var classes = [Class]()
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ClassCell") as? ClassCell {
            
            let newClass = classes[indexPath.row]
            
            cell.configureCell(newClass)
            
            return cell
            
        } else {
            return ClassCell()
        }
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        
        parseClassCSV()
    }
    
    

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    func parseClassCSV() {
        
        let fileLocation = NSBundle.mainBundle().pathForResource("ClassSelect", ofType: "tsv")!
        let tab = NSCharacterSet(charactersInString: "\t")
        let error: NSErrorPointer = nil
        if let tsv = CSV(contentsOfFile: fileLocation, delimiter: tab, encoding: NSUTF8StringEncoding, error: error) {
            
            let rows = tsv.rows
            
            for row in rows {
                let className = row["id"]!
                let classSet = row["set"]!
                let classDesc = row["description"]!
                let cellClass = Class(name: className, desc: classDesc, set: classSet)
                classes.append(cellClass)
            }

        }
        
        
//        let path = NSBundle.mainBundle().pathForResource("ClassSelect", ofType: "csv")!
//        
//        do {
//            let csv = try CSV(contentsOfURL: path)
//            let rows = csv.rows
//            print(rows.count)
//            
//            for row in rows {
//                let className = row["id"]!
//                let classSet = row["set"]!
//                let classDesc = row["description"]!
//                let cellClass = Class(name: className, desc: classDesc, set: classSet)
//                classes.append(cellClass)
//            }
//
//        } catch let err as NSError {
//            print(err.debugDescription)
//        }
    }

}

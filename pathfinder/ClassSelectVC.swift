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
    
    var classes = [Class]()
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("ClassCell") as? ClassCell {
            
            let newClass = classes[indexPath.row]
            
            cell.configureCell(newClass)
            print(newClass.desc)
            
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
        print(classes.count)
    }
    
    

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    
    func parseClassCSV() {
        let path = NSBundle.mainBundle().pathForResource("ClassSelect", ofType: "csv")!
        
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            print(rows.count)
            
            for row in rows {
                let className = row["id"]!
                let classSet = row["set"]!
                let classDesc = row["description"]!
                let cellClass = Class(name: className, desc: classDesc, set: classSet)
                classes.append(cellClass)
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }

}

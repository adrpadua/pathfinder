//
//  ClassCell.swift
//  pathfinder
//
//  Created by Adrian Padua on 1/21/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {

    @IBOutlet weak var classImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var currentClass: Class!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(cellClass: Class) {
        self.currentClass = cellClass
        
        nameLbl.text = self.currentClass.name.capitalizedString
        descLbl.text = self.currentClass.desc
        classImg.image = UIImage(named: "\(self.currentClass.name.lowercaseString)")
    }

}

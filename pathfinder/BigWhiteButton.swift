//
//  BigWhiteButton.swift
//  pathfinder
//
//  Created by Adrian Padua on 1/15/16.
//  Copyright © 2016 Adrian Padua. All rights reserved.
//

import UIKit

class BigWhiteButton: UIButton {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 4.0
        self.clipsToBounds = true
    }

}

//
//  UIColor.swift
//  Fuse
//
//  Created by Yuliia Veresklia on 1/17/16.
//  Copyright © 2016 yveres. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hex: Int) {
        self.init(red: (hex >> 16) & 0xff, green: (hex >> 8) & 0xff, blue: hex & 0xff)
    }
    
    class func fuseGreenColor() -> UIColor {
        return UIColor(hex: 0x0E9D58)
    }
    
    class func fuseRedColor() -> UIColor {
        return UIColor(hex: 0xEA4335)
    }
    
    class func fuseGrayColor() -> UIColor {
        return UIColor(hex: 0x777777)
    }
}

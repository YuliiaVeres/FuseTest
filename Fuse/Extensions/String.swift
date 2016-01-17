//
//  String.swift
//  Fuse
//
//  Created by Yuliia Veresklia on 1/17/16.
//  Copyright © 2016 yveres. All rights reserved.
//

import UIKit

extension String {
    
    func replace(string: String, replacement: String) -> String {
        
        return self.stringByReplacingOccurrencesOfString(string, withString: replacement, options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    func removeWhitespace() -> String {
        
        return self.replace(" ", replacement: "")
    }
}

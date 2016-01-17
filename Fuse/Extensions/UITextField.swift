//
//  UITextField.swift
//  Fuse
//
//  Created by Yuliia Veresklia on 1/17/16.
//  Copyright © 2016 yveres. All rights reserved.
//

import UIKit

extension UITextField {

    func validResultTextField(resultText: String?) {
    
        backgroundColor = UIColor.fuseGreenColor()
        textColor = UIColor.whiteColor()
        text = resultText
    }
    
    func invalidResultTextField(resultText: String?) {
    
        backgroundColor = UIColor.fuseRedColor()
        textColor = UIColor.whiteColor()
        text = resultText
    }
    
    func ordinaryTextField() {
    
        backgroundColor = UIColor.whiteColor()
        textColor = UIColor.fuseGrayColor()
        text = nil
    }
}
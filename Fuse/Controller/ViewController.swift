//
//  ViewController.swift
//  Fuse
//
//  Created by Yuliia Veresklia on 1/17/16.
//  Copyright © 2016 yveres. All rights reserved.
//

import UIKit
import SVProgressHUD

final class ViewController: UIViewController {
    
    @IBOutlet private weak var companyNameTextField: UITextField!
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        companyNameTextField.ordinaryTextField()
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        guard let name = textField.text?.removeWhitespace() as String? where name.characters.count >= COMPANY_NAME_MIN_LENGTH else {
            
            self.showError("Company name can't be empty")
            return true
        }
        
        performRequest(name) { (resultText, success) -> Void in
            
        }
        
        return true
    }
}

private extension ViewController {
    
    func performRequest(companyName: String, completion: (resultText: String, success: Bool) -> Void) {
        
        view.endEditing(true)
        SVProgressHUD.showWithMaskType(.Gradient)
        
        RequestManager.sharedInstance.validateCompanyName(companyName) { resultName, errorText in

            SVProgressHUD.dismiss()
            
            self.displayResults(resultName, error: errorText)
            
            return
        }
    }
    
    func showError(errorText: String) {
        
        let alert = UIAlertController(title: NSLocalizedString("Oops", comment: ""), message: NSLocalizedString(errorText, comment: ""), preferredStyle: .Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func displayResults(name: String?, error: String?) {
        
        dispatch_async(dispatch_get_main_queue()) {
            
            guard error == nil else {
                self.companyNameTextField.invalidResultTextField(error)
                return
            }
            
            self.companyNameTextField.validResultTextField(name)
        }
    }
}


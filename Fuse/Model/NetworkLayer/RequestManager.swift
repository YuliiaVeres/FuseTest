//
//  RequestManager.swift
//  Fuse
//
//  Created by Yuliia Veresklia on 1/17/16.
//  Copyright © 2016 yveres. All rights reserved.
//

import UIKit
import Alamofire

final class RequestManager: NSObject {
    
    static let sharedInstance = RequestManager()
    private override init() {}
    
    func validateCompanyName(requestedName: String, completion: (String?, String?) -> ()) {
        
        Alamofire.request(.GET, "https://\(requestedName).\(API_ADDRESS)").responseJSON { response in
            
            guard let resultObject = response.result.value as? [NSString: AnyObject], let resultName = resultObject["name"] as? String else {
                
                guard let resultObject = response.result.value as? [NSString: AnyObject],
                    let errors = resultObject["errors"] as? [String: AnyObject],
                    let errorText = errors["base"] as? String else {
                
                    completion(nil, NSLocalizedString("No such company", comment: ""))
                    return
                }
                
                completion(nil, errorText)
                return
            }
            
            completion(resultName, nil)
        }
    }
}
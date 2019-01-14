//
//  NetworkController.swift
//  NY Times Most Popular Articles
//
//  Created by Abdul Nasir B A on 14/1/19.
//  Copyright © 2019 Abdul Nasir B A. All rights reserved.
//

import UIKit
import Alamofire

class NetworkController : NetworkControllerProtocol  {
    
    /**
     Gets a Data object corresponding to given URL String.
     
     
     - parameter urlString: Full URL of the resource.
     - parameter completionHandler: Callback with opionally the returned data and error.
     
     This method accepts a string value representing the full url and a callback handler with optionally the data and error
     */
    func getData(urlString : String, completionHandler: @escaping (Data?, Error?) -> Void) {

        Alamofire.request(urlString).responseData { response in

            if let data = response.data {
                completionHandler(data, response.error)
            } else {
                completionHandler(nil, response.error)
            }
        }
    }

    /**
     Gets a JSON dictionary object corresponding to given URL String.
     
     
     - parameter urlString: Full URL of the resource.
     - parameter completionHandler: Callback with opionally the returned data and error.
     
     This method accepts a string value representing the full url and a callback handler with optionally the data and error
     */
    public func getJSON(urlString : String, completionHandler: @escaping (AnyObject, Error?) -> Void) {
        Alamofire.request(urlString).responseJSON { response in
            #if DEBUG
            print("Request: \(String(describing: response.request))")   // original url request
            print("Response: \(String(describing: response.response))") // http url response
            print("Result: \(response.result)")                         // response serialization result
            #endif

            
            if let json = response.result.value {
                print("JSON: \(json)") // serialized json response
                completionHandler(json as AnyObject, response.error)
            }
        }
        
    }
    
}

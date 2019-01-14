//
//  DataAccessManager.swift
//  NY Times Most Popular Articles
//
//  Created by Abdul Nasir B A on 14/1/19.
//  Copyright © 2019 Abdul Nasir B A. All rights reserved.
//

import UIKit


class OperationsManager {
    
    let networkController = NetworkController()

    /**
     Downloads the first available image from given MostViewedResults object.
     
     
     - parameter object: given MostViewedResults object.
     - parameter completionHandler: Callback with optional UIImage and Error.
     */
    public func downloadImage(object : MostViewedResults, completionHandler: @escaping (UIImage?, Error?) -> Void) {
    
        if let media = object.media?.first {
            
            if  let metadata = media.media_metadata?.first {
                
                self.downloadImage(urlString: (metadata.url)!, completionHandler: completionHandler)
            }
        }

    }
    
    /**
     Fetch the List of sections from the API.
     
     - parameter object: given MostViewedResults object.
     - parameter completionHandler: Callback with optional Array of SectionsResults and Error.
     
     This function utilises the network controller to get the JSON and transforms them into the Response Model.
     */
    public func getSectionsList(completionHandler: @escaping (Array<SectionsResults>?, Error?) -> Void) {
    
        let urlPath = ConfigurationManager.apiPathSectionsList()

        self.networkController.getJSON(urlString: urlPath, completionHandler: {obj, err in
            
            let responseModel = SectionsResponse(dictionary: obj as! NSDictionary)
            
            completionHandler(responseModel?.results, err)
            
        })

    }
    
    /**
     Fetch the Most Viewed Items from the API.
     
     - parameter section: Section to search e.g. all-sections.
     - parameter timePeriod: Time Period enum value.
     - parameter offset: Pagination offset for the request.
     - parameter completionHandler: Callback with optional object MostViewedResponse and Error.
     
     This function utilises the network controller to get the JSON and transforms them into the MostViewedResponse Model.
     */
    public func getMostViewed(section : String, timePeriod : TimePeriod, offset: Int, completionHandler: @escaping (MostViewedResponse?, Error?) -> Void) {
    
        let urlPath = ConfigurationManager.apiPathMostViewed(section: section, timePeriod: timePeriod.rawValue, offset: offset)
        
        self.networkController.getJSON(urlString: urlPath, completionHandler: {obj, err in
            
            let responseModel = MostViewedResponse(dictionary: obj as! NSDictionary)
            
            completionHandler(responseModel, err)
        })
    }

    /**
     Private method to make the Data call for downloading image and transform to image
     
     - parameter urlString: URL String of the image to download.
     - parameter completionHandler: Callback with UIImage and Error.
     */
    private func downloadImage(urlString : String, completionHandler: @escaping (UIImage?, Error?) -> Void) {
        
        self.networkController.getData(urlString: urlString, completionHandler: {data, err in
            
            completionHandler(UIImage(data: data!), err)
        })
    }

}

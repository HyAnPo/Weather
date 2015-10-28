//
//  NetworkController.swift
//  Weather
//
//  Created by Andrew Porter on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let baseURLString = "http://api.openweathermap.org/data/2.5/weather?q="
    static let apiKey = "&APPID=7b0fdfeb00e59a43d9edd549236aa6c8"
    
    static func searchURL(cityName: String) -> NSURL {
        let searchString = baseURLString + cityName + apiKey
        
        return NSURL(string: searchString)!
    }
    
    static func dataAtURL(url: NSURL, completion: (resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            if let error = error {
                print(error.localizedDescription)
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }
}

























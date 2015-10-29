//
//  NetworkController.swift
//  Weather
//
//  Created by Andrew Porter on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class NetworkController {
    
    static let baseURLString = "http://api.openweathermap.org/data/2.5/weather"
    static let apiKey = "dc1d2b325aae747305b697f0159d6857"
    
    static func searchURL(cityName: String) -> NSURL {
        let escapedCityString = cityName.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet())
        
        return NSURL(string: baseURLString + "?q=\(escapedCityString!)" + "&appid=\(apiKey)")!
    }
    
    static func dataAtURL(url: NSURL, completion: (resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            guard let data = data else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            completion(resultData: data)
        }
        dataTask.resume()
    }
}

























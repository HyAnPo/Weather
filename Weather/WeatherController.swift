//
//  WeatherController.swift
//  Weather
//
//  Created by Andrew Porter on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class WeatherController {
    
    
    static func searchNewCity(city: String, completion: (result: Weather?) -> Void) {
        let url = NetworkController.searchURL(city)
        
        NetworkController.dataAtURL(url) { (resultData) -> Void in
            guard let data = resultData else {
                print("Error no data was returned")
                completion(result: nil)
                return
            }
            do {
                let weatherAnyObject = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
                
                var weatherModelObject: Weather?
                
                if let weatherDictionary = weatherAnyObject as? [String : AnyObject] {
                    weatherModelObject = Weather(jsonDictionary: weatherDictionary)
                }
                
                completion(result: weatherModelObject)
        
            } catch {
                completion(result: nil)
            }
        }
        
    }
}


























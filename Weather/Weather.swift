//
//  Weather.swift
//  Weather
//
//  Created by Andrew Porter on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class Weather {
    
    static let WeatherKey = "weather"
    static let cityNameKey = "name"
    static let tempCKey = "temp"
    static let mainKey = "main"
    static let descriptionKey = "description"
    static let iconImageStringKey = "icon"
    
    var cityName: String = ""
    var main: String = ""
    var description: String = ""
    var iconImageString: String? = ""
    var iconImage: UIImage?
    var tempK: Float?
    var tempC: Float? {
        get {
            if let tempK = tempK {
                return tempK - 273.15
            }else {
                return nil
            }
        }
    }
    
    init(jsonDictionary: [String: AnyObject]) {
        if let cityName = jsonDictionary[Weather.cityNameKey] as? String {
            self.cityName = cityName
        }
        if let main = jsonDictionary[Weather.mainKey] as? [String: AnyObject] {
            if let temperature = main[Weather.tempCKey] as? NSNumber {
                self.tempK = Float(temperature)
            }
            
            if let arrayUsingWeatherKey = jsonDictionary[Weather.WeatherKey] as? [[String : AnyObject]] {
                if let description = arrayUsingWeatherKey[0] [Weather.descriptionKey] as? String {
                    self.description = description
                }
                
                if let iconImageString = arrayUsingWeatherKey[0] [Weather.iconImageStringKey] as? String {
                    self.iconImageString = iconImageString
                }
                if let main = arrayUsingWeatherKey[0][Weather.WeatherKey] as? String {
                    self.main = main
                }
            }
        }
    }
}




















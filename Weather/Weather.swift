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
    static let cityNameKey = "name"
    static let tempCKey = "temp"
    static let mainKey = "main"
    static let descriptionKey = "description"
    static let iconImageStringKey = "icon"
    
    var cityName: String = ""
    var tempC: Float? = 0.0
    var main: String = ""
    var description: String = ""
    var iconImageString: String? = ""
    var iconImage: UIImage?
    
    init(jsonDictionary: [String: AnyObject]) {
        if let name = jsonDictionary[Weather.cityNameKey] as? String {
            self.cityName = name
        }
        if let tempC = jsonDictionary[Weather.tempCKey] as? Float {
            self.tempC = tempC
        }
        if let main = jsonDictionary[Weather.mainKey] as? String {
            self.main = main
        }
        if let description = jsonDictionary[Weather.descriptionKey] as? String {
            self.description = description
        }
        if let iconImageString = jsonDictionary[Weather.iconImageStringKey] as? String {
            self.iconImageString = iconImageString
        }
    }
    
    
    
}




















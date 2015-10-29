//
//  WeatherViewController.swift
//  Weather
//
//  Created by Andrew Porter on 10/28/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {
  
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionsLabel: UILabel!
    @IBOutlet weak var skyConditionLabel: UILabel!
    
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        if let searchText = searchBar.text {
        WeatherController.searchNewCity(searchText) { (result) in
            guard let weatherResult = result else {return}
            
            dispatch_async(dispatch_get_main_queue()) { () in
                self.cityLabel.text = weatherResult.cityName
                
                if let temperatureC = weatherResult.tempC {
                    self.tempLabel.text = "\(temperatureC) °C"
                } else {
                    self.tempLabel.text = "No temp available"
                }
                
                self.conditionsLabel.text = weatherResult.main
                self.skyConditionLabel.text = weatherResult.description
                }
              }
            }
            searchBar.resignFirstResponder()
        }
    }



















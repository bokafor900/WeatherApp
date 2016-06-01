//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Bryan Okafor on 5/31/16.
//  Copyright © 2016 Oaks. All rights reserved.
//

import Foundation

protocol  WeatherServiceDelegate {
    func setWeather()
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        print("Weather Service city: \(city)")
        // request weather data
        // wait...
        
        if delegate != nil {
            delegate?.setWeather()
        }
        
    }
    
}
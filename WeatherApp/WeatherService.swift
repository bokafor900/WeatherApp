//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Bryan Okafor on 5/31/16.
//  Copyright © 2016 Oaks. All rights reserved.
//

import Foundation

protocol  WeatherServiceDelegate {
    func setWeather(weather: Weather)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        print("Weather Service city: \(city)")
        // request weather data
        // wait...
        // process data
        
        let weather = Weather(cityName: city, temp: 237.12, description: "A nice day")
        
        if delegate != nil {
            delegate?.setWeather(weather)
        }
        
    }
    
}
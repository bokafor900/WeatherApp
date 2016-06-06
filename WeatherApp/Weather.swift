//
//  Weather.swift
//  WeatherApp
//
//  Created by Bryan Okafor on 6/1/16.
//  Copyright © 2016 Oaks. All rights reserved.
//

import Foundation

struct Weather {
    let cityName: String
    let temp: Double
    let description: String
    let icon: String
    let clouds: Double
    let tempMax: Double
    let tempMin: Double

    
    var tempF: Double {
        get {
            return 1.8 * (temp - 273.15) + 32
        }
    }
    
    var tempMaxF: Double {
        get {
            return 1.8 * (tempMax - 273.15) + 32
        }
    }
    
    var tempMinF: Double {
        get {
            return 1.8 * (tempMin - 273.15) + 32
        }
    }
    
    
    
    init(cityName: String, temp:Double, description: String, icon: String, clouds: Double, tempMax: Double, tempMin: Double) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
        self.icon = icon
        self.clouds = clouds
        self.tempMax = tempMax
        self.tempMin = tempMin
        
    }
}

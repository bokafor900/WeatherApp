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
    
    
    init(cityName: String, temp:Double, description: String) {
        self.cityName = cityName
        self.temp = temp
        self.description = description
        
    }
}

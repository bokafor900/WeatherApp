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
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=823b9f94ddc4a83d2d9346b0c76a4bbb"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            //print(">>>> \(data)")
            let json = JSON(data: data!)
            let lon = json["coord"]["lon"].double
            let lat = json["coord"]["lat"].double
            let temp = json["main"]["temp"].double
            
            print("Lat: \(lat!) lon: \(lon!) temp: \(temp!)")
        }
        
        task.resume()
        
        // print("Weather Service city: \(city)")
        // request weather data
        // wait...
        // process data
        /*
        let weather = Weather(cityName: city, temp: 237.12, description: "A nice day")
        
        if delegate != nil {
            delegate?.setWeather(weather)
        }
        */
    }
    
}
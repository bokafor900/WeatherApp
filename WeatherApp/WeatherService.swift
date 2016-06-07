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
    // Describes what ever went wrong
    func weatherErrorWithMessage(message: String)
}

class WeatherService {
    
    var delegate: WeatherServiceDelegate?
    
    func getWeather(city: String) {
        
        let cityEscaped = city.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())
        let appid = "823b9f94ddc4a83d2d9346b0c76a4bbb"
        
        let path = "http://api.openweathermap.org/data/2.5/weather?q=\(cityEscaped!)&appid=\(appid)"
        let url = NSURL(string: path)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            
            //Check to see if the url is there since its optional. If not it will print a response code
            if  let httpResponse = response as? NSHTTPURLResponse {
                print(httpResponse.statusCode)
            }
            
            let json = JSON(data:data!)
            print(json)
            
            // Get the cod code: 401 Unauthorized, 404 file not found, 200 Ok!
            // OpenWeatherMap returns 404 as a string but 401 and 2000 are Int!?
            
            var status = 0
            
            if let cod = json["cod"].int {
                status = cod
            } else if let cod = json["cod"].string {
                status = Int(cod)!
            }
            
            // Check status (What the code is for the weather status)
            print("Weather status code:\(status)")
            
            if status == 200 {
                
                // everything ok
                let json = JSON(data: data!)
                let lon = json["coord"]["lon"].double
                let lat = json["coord"]["lat"].double
                let temp = json["main"]["temp"].double
                let name = json["name"].string
                let desc = json["weather"][0]["description"].string
                let icon = json["weather"][0]["icon"].string
                let clouds = json["clouds"]["all"].double
                let tempMax = json["main"]["temp_max"].double
                let tempMin = json["main"]["temp_min"].double
                
                let weather = Weather(cityName: name!, temp: temp!, description: desc!, icon: icon!, clouds: clouds!, tempMax: tempMax!, tempMin: tempMin!)
                
                if self.delegate != nil {
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.delegate?.setWeather(weather)
                    })
                }
                
            } else if status == 404 {
                // City not found
                if self.delegate != nil {
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.delegate?.weatherErrorWithMessage("City not found")
                    })
                }
            } else {
                // Some other problem
                if self.delegate != nil {
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.delegate?.weatherErrorWithMessage("New error found, find out what!")
                    })
                }
            }
            
            if status == 200 {
     
            

            
            
            
            
            

            
    
        }
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
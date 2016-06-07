//
//  ViewController.swift
//  WeatherApp
//
//  Created by Bryan Okafor on 5/29/16.
//  Copyright © 2016 Oaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WeatherServiceDelegate {
    
    let weatherService = WeatherService()
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var cloudLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.weatherService.delegate = self 
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: IBAction
    @IBAction func selectCityClicked(sender: AnyObject) {
        print("City Button Clicked")
        openCityAlert()
    }
    
    func openCityAlert() {
        // Create Alert Controller
        let alert = UIAlertController(title: "City", message: "Enter city name", preferredStyle: .Alert)
        
        // Create Cancel Action
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        // Create OK action
        let ok = UIAlertAction(title: "OK", style: .Default) { (action: UIAlertAction) -> Void in
            print("OK")
            let textField = alert.textFields?[0]
            ///print(textField?.text)
            ///self.cityLabel.text = textField?.text!
            let cityName = textField?.text
            self.weatherService.getWeather(cityName!)
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        // Add text field
        alert.addTextFieldWithConfigurationHandler { (textfield: UITextField) -> Void in
            textfield.placeholder = "City Name"
        }
        
        // Present Alert Controller
        self.presentViewController(alert, animated: true, completion: nil)
    }

    
    // MARK: - Weather Service Delegate
    
    func setWeather(weather: Weather) {
        //print("*** Set Weather")
        //print("City: \(weather.cityName) temp:\(weather.temp) desc:\(weather.description)")
        //cityLabel.text = weather.cityName
        tempLabel.text = "\(round(weather.tempF))°"
        descriptionLabel.text = weather.description
        cityButton.setTitle(weather.cityName, forState: .Normal)
        iconImage.image = UIImage(named: weather.icon)
        cloudLabel.text = "\(weather.clouds)%"
        tempMaxLabel.text = "\(round(weather.tempMaxF))°"
        tempMinLabel.text = "\(round(weather.tempMinF))°"
        
    }
    
    func weatherErrorWithMessage(message: String) {
        // display an error message from weather service
        print("Weather Error Message: \(message)")
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
        let ok = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}


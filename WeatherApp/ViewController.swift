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
    @IBOutlet weak var cityLabel: UILabel!
    

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
            print(textField?.text)
            self.cityLabel.text = textField?.text!
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
    
    func setWeather() {
        print("VC Set Weather")
    }
}


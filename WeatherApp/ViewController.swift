//
//  ViewController.swift
//  WeatherApp
//
//  Created by Bryan Okafor on 5/29/16.
//  Copyright © 2016 Oaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectCityClicked(sender: AnyObject) {
        print("City Button Clicked")
        
    }

}


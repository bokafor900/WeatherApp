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

    //MARK: IBAction
    @IBAction func selectCityClicked(sender: AnyObject) {
        print("City Button Clicked")
        openCityAlert()
    }
    
    func openCityAlert() {
        let alert = UIAlertController(title: "City", message: "Enter city name", preferredStyle: .Alert)
        
        let cancel = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let ok = UIAlertAction(title: "OK", style: .Default) { (action: UIAlertAction) -> Void in
            print("OK")
        }
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        
        
        
        
        self.presentViewController(alert, animated: true, completion: nil)
    }

}


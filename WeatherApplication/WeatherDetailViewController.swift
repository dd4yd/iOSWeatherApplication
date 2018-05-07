//
//  WeatherDetailViewController.swift
//  WeatherApplication
//
//  Created by David Dean on 5/7/18.
//  Copyright © 2018 David Dean. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textField.text = "Sunrise:\n\nSunset:\n\nPrecipitation:\n\nHumidity:\n\nWind:\n\nUV Index:\n\nPressure:"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

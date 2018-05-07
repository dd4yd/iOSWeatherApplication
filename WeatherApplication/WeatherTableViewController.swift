//
//  WeatherTableViewController.swift
//  WeatherApplication
//
//  Created by David Dean on 5/1/18.
//  Copyright © 2018 David Dean. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherTableViewController: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var weatherSearchBar: UISearchBar!
    
    var forecaseData = [WeatherParser]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weatherSearchBar.delegate = self
        
        updateWeather(location: "San Francisco")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //listen for when user taps search button in lower right corner
        weatherSearchBar.resignFirstResponder() //hides keyboard
        if let locationString = weatherSearchBar.text, !locationString.isEmpty {
            updateWeather(location: locationString)
        }
    }
    
    func updateWeather (location: String) {
        CLGeocoder().geocodeAddressString(location) { (placemarks:[CLPlacemark]?, error:Error?) in
            if error == nil {
                if let location = placemarks?.first?.location { //might have to change to location
                    WeatherParser.forecast(withLocation: location.coordinate, completion: { (results:[WeatherParser]?) in
                        
                        if let weatherData = results {
                            self.forecaseData = weatherData
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                        }
                        
                    })
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return forecaseData.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)

        let weatherObject = forecaseData[indexPath.section]
        
        cell.textLabel?.text = weatherObject.summary
        cell.detailTextLabel?.text = "\(Int(weatherObject.temperature)) ˚F"
        cell.imageView?.image = UIImage(named: weatherObject.icon)

        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let date = Calendar.current.date(byAdding: .day, value: section, to: Date())
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        
        return dateFormatter.string(from: date!)
    }

}

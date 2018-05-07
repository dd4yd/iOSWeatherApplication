//
//  DailyForecast.swift
//  WeatherApplication
//
//  Created by David Dean on 5/2/18.
//  Copyright © 2018 David Dean. All rights reserved.
//

import Foundation

struct DailyForecast {
    
    //daily weaather statistics
    var sunrise: Date = Date()
    var sunset: Date = Date()
    var precipProbability: String = ""
    var humidity: Double = 0.0
    var windSpeed: Double = 0.0
    var feelsLike: Double = 0.0
    var precipitation: Double = 0.0
    var pressure: Double = 0.0
    var visibility: Int = 0
    var UV: Int = 0
    var temperatureMax: Double = 0.0
    
}

//
//  Forecast.swift
//  WeatherApplication
//
//  Created by David Dean on 5/2/18.
//  Copyright © 2018 David Dean. All rights reserved.
//

import Foundation


class Forecast {
    var summary: String = ""
    var icon: String = ""
    var temperature: Double = 0.0
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var dailyForecasts = [DailyForecast]()
    
    init() {
        
    }
}

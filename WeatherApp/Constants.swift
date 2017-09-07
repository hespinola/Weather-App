//
//  Constants.swift
//  WeatherApp
//
//  Created by Isomi on 9/2/16.
//  Copyright © 2016 Isomi. All rights reserved.
//

import Foundation

let API_KEY = "86a0ac295d77a21d784bb9bff680d603"
let WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=16&appid=\(API_KEY)"

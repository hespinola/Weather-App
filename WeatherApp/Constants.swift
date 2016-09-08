//
//  Constants.swift
//  WeatherApp
//
//  Created by Isomi on 9/2/16.
//  Copyright © 2016 Isomi. All rights reserved.
//

import Foundation

let API_KEY = "86a0ac295d77a21d784bb9bff680d603"
let LATITUDE = "35"
let LONGITUDE = "139"
let WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast?lat=\(LATITUDE)&lon=\(LONGITUDE)&appid=\(API_KEY)"

typealias downloadCompleted = () -> ()

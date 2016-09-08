//
//  Forecast.swift
//  WeatherApp
//
//  Created by Isomi on 9/2/16.
//  Copyright © 2016 Isomi. All rights reserved.
//

import Foundation

class Forecast {
    private var _date: String!
    private var _temp: Double!
    private var _minTemp: Double!
    private var _maxTemp: Double!
    private var _weatherType: String!
    
    func fromKelvinToCelsius(temp: Double) -> Double {
        let newTemp = temp - 273.15
        return newTemp
    }
    
    var weatherType: String {
        get {
            return _weatherType
        } set {
            _weatherType = newValue
        }
    }
    
    var date: String {
        get {
            if _date == nil {
                return ""
            } else {
                return _date
            }
        } set {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE"
            let newDate = dateFormatter.string(from: Date(timeIntervalSince1970: Double(newValue)!))
            _date = newDate
        }
    }
    
    var temp: Double {
        get {
            return _temp
        } set {
            _temp = fromKelvinToCelsius(temp: newValue)
        }
    }
    
    var minTemp: Double {
        get {
            return _minTemp
        } set {
            _minTemp = fromKelvinToCelsius(temp: newValue)
        }
    }
    
    var maxTemp: Double {
        get {
            return _maxTemp
        } set {
            _maxTemp = fromKelvinToCelsius(temp: newValue)
        }
    }
    
    init() {
        _date = ""
        _weatherType = ""
        _temp = 0.0
        _minTemp = 0.0
        _maxTemp = 0.0
    }
}

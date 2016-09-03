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
    
    var date: String {
        get {
            return _date
        } set {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            let newDate = dateFormatter.string(from: Date(timeIntervalSince1970: Double(newValue)!))
            _date = newDate
        }
    }
    
    var temp: Double {
        get {
            return _temp
        } set {
            _temp = newValue
        }
    }
    
    var minTemp: Double {
        get {
            return _minTemp
        } set {
            _minTemp = newValue
        }
    }
    
    var maxTemp: Double {
        get {
            return _maxTemp
        } set {
            _maxTemp = newValue
        }
    }

}

//
//  Forecast.swift
//  WeatherApp
//
//  Created by Isomi on 9/2/16.
//  Copyright © 2016 Isomi. All rights reserved.
//

import Foundation

class Forecast {
    
    // MARK: - Class Properties
    private var _day: String!
    private var _date: String!
    private var _temp: Double!
    private var _minTemp: Double!
    private var _maxTemp: Double!
    private var _weatherType: String!
    
    var weatherType: String {
        return _weatherType
    }
    
    var day: String {
        return _day
    }
    
    var date: String {
        return _date
    }
    
    var temp: Double {
        return _temp
    }
    
    var minTemp: Double {
        return _minTemp
    }
    
    var maxTemp: Double {
        return _maxTemp
    }
    
    var formattedMinTemp: Double {
        return _minTemp.rounded()
    }
    
    var formattedMaxTemp: Double {
        return _maxTemp.rounded()
    }
    
    // MARK: - Class Methods
    init(data: Dictionary<String, AnyObject>) {
        
        if let dt = data["dt"] as? Double {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE"
            _day = dateFormatter.string(from: Date(timeIntervalSince1970: Double(dt)))
            
            dateFormatter.dateStyle = .short
            dateFormatter.dateFormat = "dd/MM/yyyy"
            _date = dateFormatter.string(from: Date(timeIntervalSince1970: Double(dt)))
            
        } else {
            _day = ""
            _date = ""
        }
        
        if let weather = data["weather"] as? [Dictionary<String, AnyObject>] {
            if let type = weather[0]["main"] as? String {
                _weatherType = type
            }
            
        } else {
            _weatherType = ""
        }
        
        if let tempData = data["temp"] as? Dictionary<String, AnyObject> {
            if let min = tempData["min"] as? Double {
                _minTemp = min
            }
            
            if let max = tempData["max"] as? Double {
                _maxTemp = max
            }
            
            if let newTemp = tempData["day"] as? Double {
                _temp = newTemp
            }
            
        } else {
            _minTemp = 0.0
            _maxTemp = 0.0
            _temp = 0.0
        }
    }
    
    func fromKelvinToCelsius(temp: Double) -> Double {
        return temp - 273.15
    }
}

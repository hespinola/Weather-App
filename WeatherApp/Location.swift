//
//  Location.swift
//  WeatherApp
//
//  Created by Isomi on 9/7/16.
//  Copyright © 2016 Isomi. All rights reserved.
//

import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var longitude: Double!
    var latitude: Double!
}

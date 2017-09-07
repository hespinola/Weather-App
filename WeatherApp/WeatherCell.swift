//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Isomi on 9/2/16.
//  Copyright © 2016 Isomi. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    // MARK: - UI Elements
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    // Configure Cell
    func configureCell(forecast: Forecast) {
        dayLabel.text = forecast.day
        dateLabel.text = forecast.date
        minTempLabel.text = "Min: " + forecast.formattedMinTemp
        maxTempLabel.text = "Max: " + forecast.formattedMaxTemp
        
        if let image = UIImage(named: "\(forecast.weatherType) Mini") {
            weatherImage.image = image
        } else {
            weatherImage.image = UIImage(named: "Clear Mini")
        }
    }
}

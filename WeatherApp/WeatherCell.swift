//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Isomi on 9/2/16.
//  Copyright © 2016 Isomi. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var maxTempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    var forecast: Forecast!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // Configure Cell
    func configureCell(forecast: Forecast) {
        dayLabel.text = forecast.date
        minTempLabel.text = "\(Int(forecast.formattedMinTemp)) ºC"
        maxTempLabel.text = "\(Int(forecast.formattedMaxTemp)) ºC"
        
        if let image = UIImage(named: "\(forecast.weatherType) Mini") {
            weatherImage.image = image
        } else {
            weatherImage.image = UIImage(named: "Clear Mini")
        }
    }
}

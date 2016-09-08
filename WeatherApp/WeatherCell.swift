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
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    var forecast: Forecast!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI() {
        self.dayLabel.text = self.forecast.date
        self.weatherImage.image = UIImage(named: self.forecast.weatherType)
        self.minTemp.text = "\(self.forecast.minTemp)"
        self.maxTemp.text = "\(self.forecast.maxTemp)"
    }

}

//
//  MainVC.swift
//  WeatherApp
//
//  Created by Isomi on 9/2/16.
//  Copyright © 2016 Isomi. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var todayLbl: UILabel!
    @IBOutlet weak var todayWeather: UIImageView!
    @IBOutlet weak var todayWeatherLbl: UILabel!
    @IBOutlet weak var todayTemp: UILabel!
    
    var forecasts = [Forecast]()
    var locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            
            // Download Forecast
            downloadForecast {
                // Update today
                self.todayLbl.text = "Today, \(self.forecasts[0].date)"
                self.todayWeather.image = UIImage(named: "\(self.forecasts[0].weatherType)")
                self.todayWeatherLbl.text = self.forecasts[0].weatherType
                self.todayTemp.text = "\(self.forecasts[0].temp) ºC"
                
                self.forecasts.remove(at: 0)
                self.tableView.reloadData()
            }
            
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    
    func downloadForecast(completed: @escaping downloadCompleted) {
        Alamofire.request(WEATHER_URL, method: .get).responseJSON(completionHandler: { (response) in
            
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                // City
                if let city = dict["city"] as? Dictionary<String, AnyObject> {
                    if let cityName = city["name"] as? String {
                        if let country = city["country"] as? String {
                            self.cityLbl.text = "\(cityName), \(country)"
                        }
                    }
                }
                
                // Get forecasts
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for day in list {
                        let forecast = Forecast()
                        
                        if let date = day["dt"] as? Double {
                            forecast.date = "\(date)"
                        }
                        
                        if let temp = day["temp"] as? Dictionary<String, AnyObject> {
                            if let min = temp["min"] as? Double {
                                forecast.minTemp = min
                            }
                            
                            if let max = temp["max"] as? Double {
                                forecast.maxTemp = max
                            }
                            
                            if let newTemp = temp["day"] as? Double {
                                forecast.temp = newTemp
                            }
                        }
                        
                        if let weather = day["weather"] as? [Dictionary<String, AnyObject>] {
                            if let weatherType = weather[0]["main"] as? String {
                                forecast.weatherType = weatherType
                            }
                        }
                        
                        self.forecasts.append(forecast)
                    }
                }
            }
            completed()
        })
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell") as? WeatherCell {
            
            cell.forecast = forecasts[indexPath.row]
            cell.updateUI()
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    

}


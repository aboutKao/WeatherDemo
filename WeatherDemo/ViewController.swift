//
//  ViewController.swift
//  WeatherDemo
//
//  Created by redinfo on 2020/10/20.
//  Copyright © 2020 redinfo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        WeeklyWeatherForeast.downloadWeeklyWeatherForecast { (weeklyArray) in
            for forecast in weeklyArray {
                print("一週預報\(forecast.date) , \(forecast.temp) , \(forecast.weatherIcon)")
            }
        }
        
    }


}


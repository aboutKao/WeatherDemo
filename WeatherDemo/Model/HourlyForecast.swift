//
//  HourlyForecast.swift
//  WeatherDemo
//
//  Created by redinfo on 2020/10/21.
//  Copyright © 2020 redinfo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class HourlyForecast {
    
    private var _date: Date!
    private var _temp: Double!
    private var _weatherIcon: String!
    
    var date: Date {
        if _date == nil {
            _date = Date()
        }
        return _date
    }
    
    var temp: Double {
        if _temp == nil {
            _temp = 0.0
        }
        return _temp
    }
    
    var weatherIcon: String {
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
        return _weatherIcon
    }
    
    init(weatherDictionary: [String: AnyObject]) {
        let json = JSON(weatherDictionary)
        
        self._temp = json["temp"].double
        self._date = currentDateFromUnix(unixDate: json["ts"].double)
        self._weatherIcon = json["weather"]["icon"].stringValue
    }
    
    //下載每日天氣預報
    class func downloadDailyForecastWeather(completion: @escaping (_ hourlyForecast: [HourlyForecast]) -> Void) {
        let hourlyForecast_URL = "https://api.weatherbit.io/v2.0/forecast/hourly?city=Taichung,TW&hours=24&key=6d3e9a53702d41efb732fa02f7828dcc"
        
        AF.request(hourlyForecast_URL).responseJSON { (response) in
            if let result = response.response {
                var forecastArray: [HourlyForecast] = []
                
                if result.statusCode == 200 {
                    print("結果：", response.value)
                    if let dictionary = response.value as? [String: AnyObject] {
                        if let list = dictionary["data"] as? [[String: AnyObject]] {
                            for item in list {
                                let forecast = HourlyForecast(weatherDictionary: item)
                                forecastArray.append(forecast)
                            }
                        }
                    }
                    completion(forecastArray)
                } else {
                    completion(forecastArray)
                    print("獲取當日天氣預報失敗")
                }
            }
        }
    }
    
}

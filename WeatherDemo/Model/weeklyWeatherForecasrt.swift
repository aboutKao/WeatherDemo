//
//  weeklyWeatherForecasrt.swift
//  WeatherDemo
//
//  Created by redinfo on 2020/10/21.
//  Copyright © 2020 redinfo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeeklyWeatherForeast {
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
    
    class func downloadWeeklyWeatherForecast(completion: @escaping (_ weatherFOrecast: [WeeklyWeatherForeast]) -> Void) {
        let weeklyForecast_URL = "https://api.weatherbit.io/v2.0/forecast/daily?city=Taichung,TW&days=7&key=6d3e9a53702d41efb732fa02f7828dcc"
        
        AF.request(weeklyForecast_URL).responseJSON { (response) in
            
            if let result = response.response {
                var forecastArray: [WeeklyWeatherForeast] = []
                
                if result.statusCode == 200 {
                    
                    if let dictionary = response.value as? [String: AnyObject] {
                        if var list = dictionary["data"] as? [[String: AnyObject]] {
                            //刪除今日天氣
                            list.remove(at: 0)
                            print("天數", list.count)
                            
                            for item in list {
                                let forecast = WeeklyWeatherForeast(weatherDictionary: item)
                                forecastArray.append(forecast)
                            }
                        }
                    }
                    print("一週天氣", response.value)
                    completion(forecastArray)
                } else {
                    completion(forecastArray)
                    print("獲取一週天氣預報失敗")
                }
            }
        }
        
    }
}

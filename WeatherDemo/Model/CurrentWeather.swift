//
//  CurrentWeather.swift
//  WeatherDemo
//
//  Created by redinfo on 2020/10/20.
//  Copyright © 2020 redinfo. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class CurrentWeather {
    
    private var _city: String!
    private var _date: Date!
    private var _currentTemp: Double!
    private var _feelsLike: Double!
    private var _uv:  Double!
    private var _weatherType: String!
    //壓力
    private var _pressure: Double!
    //濕度
    private var _humidity: Double!
    private var _windSpeed: Double!
    private var _weatherIcon: String!
    //能見度
    private var _visibitity: Double!
    private var _sunrise: String!
    private var _sunset: String!
    
    
    var city: String {
        if _city == nil {
            _city = ""
        }
        return _city
    }
    
    var date: Date {
        if _date == nil {
            _date = Date()
        }
        return _date
    }
    
    var uv: Double {
        if _uv == nil {
            _uv = 0.0
        }
        return _uv
    }
    
    var sunrise: String {
        if _sunrise == nil {
            _sunrise = ""
        }
        return _sunrise
    }
    
    var sunset: String {
        if _sunset == nil {
            _sunset = ""
        }
        return _sunset
    }
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var feelsLike: Double {
        if _feelsLike == nil {
            _feelsLike = 0.0
        }
        return _feelsLike
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var pressure: Double {
        if _pressure == nil {
            _pressure = 0.0
        }
        return _pressure
    }
    
    var humidity: Double {
        if _humidity == nil {
            _humidity = 0.0
        }
        return _humidity
    }
    
    var windSpeed: Double {
        if _windSpeed == nil {
            _windSpeed = 0.0
        }
        return _windSpeed
    }
    
    var weatherIcon: String {
        if _weatherIcon == nil {
            _weatherIcon = ""
        }
        return _weatherIcon
    }
    
    var visibility: Double {
        if _visibitity == nil {
            _visibitity = 0.0
        }
        return _visibitity
    }
    
    
    func getCurrentWeather(comoletion: @escaping(_ success: Bool) -> Void) {
    
        let locationAPI_URL = "https://api.weatherbit.io/v2.0/current?city=Taichung,TW&key=6d3e9a53702d41efb732fa02f7828dcc"
        
        
        AF.request(locationAPI_URL).responseJSON { (response) in
            let value = response.value
            if let result = response.response {
                switch result.statusCode {
                case 200:
                    let json = JSON(value)
//                    print("成功", json)
                    self._city = json["data"][0]["city_name"].stringValue
                    self._date = currentDateFromUnix(unixDate: json["data"][0]["ts"].double)
                    self._weatherType = json["data"][0]["weather"]["description"].stringValue
                    self._currentTemp = json["data"][0]["temp"].double
                    self._feelsLike = json["data"][0]["app_temp"].double
                    self._pressure = json["data"][0]["pres"].double
                    self._humidity = json["data"][0]["rh"].double
                    self._windSpeed = json["data"][0]["wind_spd"].double
                    self._weatherIcon = json["data"][0]["weather"]["icon"].stringValue
                    self._visibitity = json["data"][0]["vis"].double
                    self._uv = json["data"][0]["uv"].double
                    self._sunrise = json["data"][0]["sunrise"].stringValue
                    self._sunset = json["data"][0]["sunset"].stringValue
                    
                    comoletion(true)
                    print("取得城市", self.city)
                    
                default:
                    comoletion(false)
                    print("找不到結果")
                    fatalError()
                }
            }
            
        }
    }
    
    
}

//
//  GlobalHelpers.swift
//  WeatherDemo
//
//  Created by redinfo on 2020/10/21.
//  Copyright © 2020 redinfo. All rights reserved.
//

import Foundation

//Date可能不會回傳成功所以回傳Date?
func currentDateFromUnix(unixDate: Double?) -> Date? {
    if unixDate != nil {
        return Date(timeIntervalSince1970: unixDate!)
    } else {
        return Date()
    }
}

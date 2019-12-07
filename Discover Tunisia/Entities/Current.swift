//
//  Current.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/5/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Current : Mappable {
    var observation_time : String?
    var temperature : Int?
    var weather_code : Int?
    var weather_icons : [String]?
    var weather_descriptions : [String]?
    var wind_speed : Int?
    var wind_degree : Int?
    var wind_dir : String?
    var pressure : Int?
    var precip : Int?
    var humidity : Int?
    var cloudcover : Int?
    var feelslike : Int?
    var uv_index : Int?
    var visibility : Int?
    var is_day : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        observation_time <- map["observation_time"]
        temperature <- map["temperature"]
        weather_code <- map["weather_code"]
        weather_icons <- map["weather_icons"]
        weather_descriptions <- map["weather_descriptions"]
        wind_speed <- map["wind_speed"]
        wind_degree <- map["wind_degree"]
        wind_dir <- map["wind_dir"]
        pressure <- map["pressure"]
        precip <- map["precip"]
        humidity <- map["humidity"]
        cloudcover <- map["cloudcover"]
        feelslike <- map["feelslike"]
        uv_index <- map["uv_index"]
        visibility <- map["visibility"]
        is_day <- map["is_day"]
    }

}

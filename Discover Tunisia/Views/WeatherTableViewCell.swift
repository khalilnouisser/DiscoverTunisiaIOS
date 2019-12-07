//
//  WeatherTableViewCell.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/5/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import AFDateHelper

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dayUILabel: UILabel!
    @IBOutlet weak var regionUILabel: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var tempUIImage: UIImageView!
    
    func initElements(with obj: Weather) {
        let date = Date()
        let days = ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"]
        let index = (date.component(.weekday) ?? 0) % 7
        dayUILabel.text = "\(days[index]) \(date.component(.day) ?? 0)"
        regionUILabel.text =  obj.location?.region ?? ""
        if regionUILabel.text == "" {
            regionUILabel.text =  obj.location?.country ?? ""
        }
        weatherDescription.text = (obj.current?.weather_descriptions ?? [""])[0]
        var weatherImage = "006-sun"
        switch obj.current?.weather_code ?? 0 {
        case 113:
            weatherImage = "006-sun"
        case 116,143,248:
            weatherImage = "009-cloudy-day-1"
        case 119,122,263,266:
            weatherImage = "029-cloudy-day"
        case 176:
            weatherImage = "015-rain-1"
        case 179,185,227,260,293:
            weatherImage = "013-snowing-1"
        case 182,281:
            weatherImage = "012-snowing-2"
        case 200:
            weatherImage = "002-storm-2"
        case 230,284,299,302:
            weatherImage = "003-storm-1"
        case 296:
            weatherImage = "015-rain-1"
        case 305, 308:
            weatherImage = "002-storm-2"
        case 311:
            weatherImage = "011-snowing-3"
        default:
            break
        }
        tempUIImage.image = UIImage(named: weatherImage)
        
    }
    
}

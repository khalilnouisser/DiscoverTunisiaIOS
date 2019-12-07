//
//  Location.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/5/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Location : Mappable {
    var name : String?
    var country : String?
    var region : String?
    var lat : String?
    var lon : String?
    var timezone_id : String?
    var localtime : String?
    var localtime_epoch : Int?
    var utc_offset : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        name <- map["name"]
        country <- map["country"]
        region <- map["region"]
        lat <- map["lat"]
        lon <- map["lon"]
        timezone_id <- map["timezone_id"]
        localtime <- map["localtime"]
        localtime_epoch <- map["localtime_epoch"]
        utc_offset <- map["utc_offset"]
    }

}

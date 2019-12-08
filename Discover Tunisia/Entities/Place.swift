//
//  Place.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/8/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Place : Mappable {
    var id : String?
    var name : String?
    var description : String?
    var stars : String?
    var city : String?
    var alt : String?
    var lat : String?
    var type : String?
    var adress : String?
    var phone : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        stars <- map["stars"]
        city <- map["city"]
        alt <- map["alt"]
        lat <- map["lat"]
        type <- map["type"]
        adress <- map["adress"]
        phone <- map["phone"]
    }

}

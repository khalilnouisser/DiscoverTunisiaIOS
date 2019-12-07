//
//  City.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/6/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct City : Mappable {
    var id : String?
    var name : String?
    var description : String?
    var map_picture : String?
    var cover1 : String?
    var cover2 : String?
    var cover3 : String?
    var cover4 : String?
    var link : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        map_picture <- map["map_picture"]
        cover1 <- map["cover1"]
        cover2 <- map["cover2"]
        cover3 <- map["cover3"]
        cover4 <- map["cover4"]
        link <- map["link"]
    }

}

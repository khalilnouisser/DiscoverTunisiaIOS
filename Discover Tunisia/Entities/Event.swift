//
//  Event.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Event : Mappable {
    var id : String?
    var name : String?
    var date : String?
    var description : String?
    var thumbnail : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        date <- map["date"]
        description <- map["description"]
        thumbnail <- map["thumbnail"]
    }

}

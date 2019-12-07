//
//  EventCalendar.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/6/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct EventCalendar : Mappable {
    var id : String?
    var date : String?
    var description : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        date <- map["date"]
        description <- map["description"]
    }

}

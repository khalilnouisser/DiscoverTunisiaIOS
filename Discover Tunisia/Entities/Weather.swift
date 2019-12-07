//
//  Weather.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/5/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Weather : Mappable {
    var request : Request?
    var location : Location?
    var current : Current?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        request <- map["request"]
        location <- map["location"]
        current <- map["current"]
    }

}

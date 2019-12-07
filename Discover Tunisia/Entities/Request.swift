//
//  Request.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/5/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Request : Mappable {
    var type : String?
    var query : String?
    var language : String?
    var unit : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        type <- map["type"]
        query <- map["query"]
        language <- map["language"]
        unit <- map["unit"]
    }

}

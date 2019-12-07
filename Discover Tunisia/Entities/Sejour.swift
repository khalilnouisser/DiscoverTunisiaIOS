//
//  Sejour.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Sejour : Mappable {
    var id : String?
    var name : String?
    var thumbnail : String?
    var cover : String?
    var monsejourelements : [MonSejourElement]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        thumbnail <- map["thumbnail"]
        cover <- map["cover"]
        monsejourelements <- map["monsejourelements"]
    }

}

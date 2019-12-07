//
//  Monsejourelement.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct MonSejourElement : Mappable {
    var id : String?
    var name : String?
    var description : String?
    var thumbnail : String?
    var category_id : String?
    var category_name : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        thumbnail <- map["thumbnail"]
        category_id <- map["category_id"]
        category_name <- map["category_name"]
    }

}

//
//  IncontournableAddress.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct IncontournableAddress : Mappable {
    var id : String?
    var titre : String?
    var content : String?
    var type_incontournable : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        titre <- map["titre"]
        content <- map["content"]
        type_incontournable <- map["type_incontournable"]
    }

}

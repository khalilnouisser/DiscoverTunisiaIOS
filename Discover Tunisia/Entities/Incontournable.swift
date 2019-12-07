//
//  Incontournable.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Incontournable : Mappable {
    var id : String?
    var type : String?
    var detail : String?
    var cover : String?
    var adresses : [IncontournableAddress]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        type <- map["type"]
        detail <- map["detail"]
        cover <- map["cover"]
        adresses <- map["adresses"]
    }

}

//
//  Gallery.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct Gallery : Mappable {
    var id : String?
    var type : String?
    var video_link : String?
    var image : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        type <- map["type"]
        video_link <- map["video_link"]
        image <- map["image"]
    }

}

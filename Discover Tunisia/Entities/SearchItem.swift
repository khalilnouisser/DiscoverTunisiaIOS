//
//  SearchItem.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/7/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

struct SearchItem : Mappable {
    var type : String?
    var event : Event?
    var incontournable : Incontournable?
    var incontournable_detail : IncontournableAddress?
    var monsejour : Sejour?
    var monsejourelements : MonSejourElement?
    
    var title: String {
        get {
            switch type ?? "" {
            case "event":
                return event?.name ?? ""
            case "incontournable":
                return incontournable?.type ?? ""
            case "incontournable_detail":
                return incontournable_detail?.titre ?? ""
            case "monsejour":
                return monsejour?.name ?? ""
            case "monsejourelements":
                return monsejourelements?.name ?? ""
            default:
                return ""
            }
        }
    }
    
    var description: String {
        get {
            switch type ?? "" {
            case "event":
                return event?.description ?? ""
            case "incontournable":
                return incontournable?.detail ?? ""
            case "incontournable_detail":
                return incontournable_detail?.content ?? ""
            case "monsejour":
                return monsejour?.description ?? ""
            case "monsejourelements":
                return monsejourelements?.description ?? ""
            default:
                return ""
            }
        }
    }

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        type <- map["type"]
        event <- map["event"]
        incontournable <- map["incontournable"]
        incontournable_detail <- map["incontournable_detail"]
        monsejour <- map["monsejour"]
        monsejourelements <- map["monsejourelements"]
        
    }

}

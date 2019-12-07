//
//  User.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/6/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import ObjectMapper

class User : NSObject, Mappable, NSCoding {
    var id : String?
    var name : String?
    var email : String?
    var password : String?
    var avatar : String?
    var userImage: String {
        get {
            return avatar != nil ? avatar! : "https://europe.ypard.net/sites/default/files/styles/user_thumbnail/public/default_images/user-image.png"
        }
    }

    convenience required init?(map: Map) {
        self.init()
    }
    
    override init() {
        
    }
    
    init(id: String = "",name: String, email: String, password: String, avatar: String = "") {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.avatar = avatar
    }

    func mapping(map: Map) {

        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        password <- map["password"]
        avatar <- map["avatar"]
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        self.init()
        self.id = aDecoder.decodeObject(forKey: "id") as? String
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.email = aDecoder.decodeObject(forKey: "email") as? String
        self.password = aDecoder.decodeObject(forKey: "password") as? String
        self.avatar = aDecoder.decodeObject(forKey: "avatar") as? String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "id")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(email, forKey: "email")
        aCoder.encode(password, forKey: "password")
        aCoder.encode(avatar, forKey: "avatar")
    }
}

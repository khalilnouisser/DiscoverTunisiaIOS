//
//  AuthService.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/6/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
class AuthService {
    static var connectedUser : User? {
        get {
            if let decoded  = UserDefaults.standard.value(forKey: "connectedUser") as? Data {
                return try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(decoded) as? User
            }
            return nil
        }
        set {
            if newValue != nil {
                save(newValue!)
            } else {
                logout()
            }
        }
    }
    
    static private func save(_ v: User){
        let userDefaults = UserDefaults.standard
        let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: v)
        userDefaults.set(encodedData, forKey: "connectedUser")
        userDefaults.synchronize()
    }
    
    static private func logout(){
        UserDefaults.standard.set(nil, forKey: "connectedUser")
        UserDefaults.standard.synchronize()
    }
    
    static var displayedIntro : Bool {
        get {
            return UserDefaults.standard.bool(forKey: "displayedIntro")
        }
        set(v) {
            UserDefaults.standard.setValue(true, forKey: "displayedIntro")
            UserDefaults.standard.synchronize()
        }
    }
}

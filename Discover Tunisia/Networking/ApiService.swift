//
//  ApiService.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/5/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import FacebookLogin
import FBSDKCoreKit

let baseURL = "https://streamerzapps.com/ontt_web_services/api"

class APIService {
    
    static func getCurrentWeather(query: String, completionHandler: @escaping (Weather?, Error?) -> Void) {
        let access_key = "5967dc48c5ac3da71cb8e816b5ab464c"
        let url = "http://api.weatherstack.com/current?access_key=\(access_key)&query=\(query.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed) ?? ""))"
        AF.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                guard let jsonResponse = result as? [String: Any] else {
                   completionHandler(nil, BackendError.connection)
                   return
               }
               
               completionHandler(Weather(JSON: jsonResponse), nil)
               return
            
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func signup(name: String, email: String, password: String, completionHandler: @escaping (User?, Error?) -> Void) {
        let user = User(name: name, email: email, password: password)
        let url = "\(baseURL)/user/create.php"
        print(url)
        AF.request(url, method: HTTPMethod.post, parameters: user.toJSON(), encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let jsonResponse = result as? [[String: Any]], jsonResponse.count > 0 {
                    let createdUser = User(JSON: jsonResponse[0])
                    completionHandler(createdUser, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func signin(email: String, password: String, completionHandler: @escaping (User?, Error?) -> Void) {
        let body = [
            "email": email,
            "password": password
        ]
        let url = "\(baseURL)/user/connexion.php"
        print(url)
        AF.request(url, method: HTTPMethod.post, parameters: body, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let jsonResponse = result as? [[String: Any]], jsonResponse.count > 0 {
                    let createdUser = User(JSON: jsonResponse[0])
                    completionHandler(createdUser, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func getCities(completionHandler: @escaping ([City]?, Error?) -> Void) {
        AF.request("\(baseURL)/city/read.php", method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let jsonResponse = result as? [String: Any], let array = jsonResponse["data"] as? [[String: Any]] {
                    let cities = array.map { (elm) -> City in
                        City(JSON: elm)!
                    }
                    completionHandler(cities, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func getCalendarEvents(completionHandler: @escaping ([EventCalendar]?, Error?) -> Void) {
        AF.request("\(baseURL)/calendar/read.php", method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let jsonResponse = result as? [String: Any], let array = jsonResponse["data"] as? [[String: Any]] {
                    let events = array.map { (elm) -> EventCalendar in
                        EventCalendar(JSON: elm)!
                    }
                    completionHandler(events, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func getListEvents(completionHandler: @escaping ([Event]?, Error?) -> Void) {
        AF.request("\(baseURL)/event/read.php", method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let jsonResponse = result as? [String: Any], let array = jsonResponse["data"] as? [[String: Any]] {
                    let events = array.map { (elm) -> Event in
                        Event(JSON: elm)!
                    }
                    completionHandler(events, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func getListSejour(completionHandler: @escaping ([Sejour]?, Error?) -> Void) {
        AF.request("\(baseURL)/monsejour/read.php", method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let jsonResponse = result as? [String: Any], let array = jsonResponse["data"] as? [[String: Any]] {
                    let sejours = array.map { (elm) -> Sejour in
                        Sejour(JSON: elm)!
                    }
                    completionHandler(sejours, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func getListSejourElementsById(id: String, completionHandler: @escaping ([MonSejourElement]?, Error?) -> Void) {
        AF.request("\(baseURL)/monsejourelements/read_single.php?id=\(id)", method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let array = result as? [[String: Any]]{
                    let sejourElements = array.map { (elm) -> MonSejourElement in
                        MonSejourElement(JSON: elm)!
                    }
                    completionHandler(sejourElements, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func getListSejour(completionHandler: @escaping ([Sejour]?, Error?) -> Void) {
        AF.request("\(baseURL)/monsejour/read.php", method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let jsonResponse = result as? [String: Any], let array = jsonResponse["data"] as? [[String: Any]] {
                    let sejours = array.map { (elm) -> Sejour in
                        Sejour(JSON: elm)!
                    }
                    completionHandler(sejours, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    static func getListSejourElementsById(id: String, completionHandler: @escaping ([MonSejourElement]?, Error?) -> Void) {
        AF.request("\(baseURL)/monsejourelements/read_single.php?id=\(id)", method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
            switch response.result {
            case let .success(result):
                if let array = result as? [[String: Any]]{
                    let sejourElements = array.map { (elm) -> MonSejourElement in
                        MonSejourElement(JSON: elm)!
                    }
                    completionHandler(sejourElements, nil)
                    return
                } else {
                    completionHandler(nil, BackendError.connection)
                    return
                }
            case .failure(_):
               completionHandler(nil, BackendError.technicalProblem)
            }
        })
    }
    
    class Login {
        class Facebook {

            static func login(completionHandler: @escaping (User?, Error?) -> Void) {
                let loginManager = LoginManager()
                loginManager.logIn(permissions: [  .email, .custom("user_link") ], viewController: nil) { loginResult in
                    switch loginResult {
                    case .failed:
                        completionHandler(nil, nil)
                    case .cancelled:
                        completionHandler(nil, nil)
                    case .success(_, _, let accessToken):
                        print(accessToken)
                        self.getInformations(accessToken, completionHandler: { (user, error) in
                            completionHandler(user, error)
                        })
                    }
                }
            }

            static func getInformations(_ accessToken: AccessToken, completionHandler: @escaping (User?, Error?) -> Void) {
                let params = ["fields": "id, name, first_name, last_name, picture.type(large), email, link"]
                let graphRequest = GraphRequest(graphPath: "me", parameters: params)
                graphRequest.start { (_, graphResponse, error) in
                    if error != nil {
                        completionHandler(nil, nil)
                    } else {
                        if let responseDictionary = graphResponse as? [String: Any] {
                            let name: String = (responseDictionary["name"] as? String) ?? " "
                            var email: String? = ""
                            if !(responseDictionary["email"] is NSNull) {
                                email = responseDictionary["email"] as? String
                            }
                            let link  = responseDictionary["link"] as? String
                            let image = responseDictionary["picture"] as? String ?? ""
                            let body = [
                                "name" : name,
                                "email" : email,
                                "avatar": image
                            ]
                            AF.request("\(baseURL)/user/connexion_facebook.php", method: HTTPMethod.post, parameters: body, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
                                switch response.result {
                                case let .success(result):
                                    if let jsonResponse = result as? [[String: Any]], jsonResponse.count > 0 {
                                        let createdUser = User(JSON: jsonResponse[0])
                                        completionHandler(createdUser, nil)
                                        return
                                    } else {
                                        completionHandler(nil, BackendError.connection)
                                        return
                                    }
                                case .failure(_):
                                   completionHandler(nil, BackendError.technicalProblem)
                                }
                            })
                        } else {
                            completionHandler(nil, nil)
                        }
                    }
                }
            }
        }

    }

}

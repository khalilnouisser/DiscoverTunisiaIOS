//
//  Utils.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 12/5/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit

class Utils {
    static func changeLanguage(view: UIViewController){
        let alert = UIAlertController(title: "Change language", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Français", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "العربية", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Italiano", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "English", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Deutsch", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "中国", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Pyc", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "český", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Polski", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Español", style: .default, handler: nil))
        view.present(alert, animated: true)
    }
    static func reverseGeocodeLocation(latitude: Double, longitude: Double, handler : @escaping (String) -> Void) {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) -> Void in
            var adresse = ""

            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]

            adresse = ""
            // Location name
            if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
                print(locationName)
            }
            // Street address
            if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
                print("streeeet \(street)")
                adresse = "\(street)"
            }
            // City
            if let city = placeMark.addressDictionary!["City"] as? NSString {
                print(city)
                adresse = "\(city)"
            }
            // Zip code
            if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
                print(zip)
            }

            if let county = placeMark.addressDictionary!["State"] as? NSString {
                if adresse == "" {
                    adresse = county as String
                }
            }

            print(adresse)
            handler(adresse)
            })
    }

}

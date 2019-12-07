//
//  MapViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController {

    @IBOutlet weak var mapView : GMSMapView!
    
    var initialLatitude: CLLocationDegrees = 36.856392
    var initialLongitude: CLLocationDegrees = 10.1922563
    var initialZoom: Float = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            // Set the map style by passing the URL of the local file.
            if let styleURL = Bundle.main.url(forResource: "map", withExtension: "json") {
                mapView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }

        mapView.delegate = self
        let camera = GMSCameraPosition.camera(withLatitude: initialLatitude,
                                              longitude: initialLongitude, zoom: initialZoom)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        self.navigationController?.navigationBar.alpha = 0
    }
    
    
    @IBAction func clickBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.alpha = 0
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.alpha = 1
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.alpha = 1
    }

}

extension MapViewController : GMSMapViewDelegate {
    
}

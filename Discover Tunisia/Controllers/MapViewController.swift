//
//  MapViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import GoogleMaps
import ScalingCarousel

class MapViewController: UIViewController, GMSMapViewDelegate {

    @IBOutlet weak var mapView : GMSMapView!
    @IBOutlet weak var carousel: ScalingCarouselView!

    var places : [Place] = []
    var markers: [GMSMarker] = []
    var category = 0 {
        didSet {
            self.categoryUILabel.text = self.categories[category]
            self.filterPlaces()
        }
    }
    @IBOutlet weak var categoryUILabel : UILabel!
    var categories = ["Hôtel", "Restaurant", "Agence de voyage", "Bureau d'accueil"]
    var categories_types = ["Hotel", "Restaurant", "Agence de voyage", "Bureau accueil"]
    var filtredPlaces : [Place] = [] {
        didSet {
            mapView.clear()
            self.markers.forEach { (elm) in
                elm.map = nil
            }
            self.markers.removeAll()
            print(filtredPlaces.count)
            self.filtredPlaces.forEach { (elm) in
                let marker = GMSMarker()
                marker.position = CLLocationCoordinate2DMake(CLLocationDegrees(Double(elm.lat ?? "0") ?? 0), CLLocationDegrees(Double(elm.alt ?? "0") ?? 0))
                print(marker.position)
                marker.icon = UIImage(named: "pin-not-selected")
                marker.map = self.mapView
                self.markers.append(marker)
            }
            if self.filtredPlaces.count > 0 {
                self.mapView.selectedMarker = markers[0]
                self.mapView.selectedMarker?.icon = UIImage(named: "pin-selected")
                self.centerOnSelectedMarker()
            }
            self.carousel.reloadData()
        }
    }
    
    
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
        self.category = 0
        let camera = GMSCameraPosition.camera(withLatitude: initialLatitude,
                                              longitude: initialLongitude, zoom: initialZoom)
        mapView.camera = camera
        mapView.isMyLocationEnabled = true
        self.navigationController?.navigationBar.alpha = 0
        
        APIService.getPlaces { (list, error) in
            if error == nil {
                self.places = list ?? []
                self.filterPlaces()
            }
        }
    }
    
    func filterPlaces() {
        self.filtredPlaces = self.places.filter({ (elm) -> Bool in
            return elm.type == self.categories_types[category]
        })
    }
    
    
    @IBAction func clickBack(){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func filtre(){
        let alert = UIAlertController(title: "Filtre", message: "", preferredStyle: .alert)
        for i in 0...self.categories.count-1 {
            alert.addAction(UIAlertAction(title: self.categories[i], style: .default, handler: { (elm) in
                self.category = i
            }))
        }
        alert.addAction(UIAlertAction(title: "Annuler", style: .cancel))
        self.present(alert, animated: true)
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
    
    func centerOnSelectedMarker() {
        UIView.animate(withDuration: 1) {
            self.mapView.animate(toLocation: CLLocationCoordinate2D(latitude: self.mapView.selectedMarker?.position.latitude ?? 0, longitude: self.mapView.selectedMarker?.position.longitude ?? 0))
            self.mapView.animate(toZoom: 13)
        }
    }

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        let lat = marker.position.latitude
        let lon = marker.position.longitude
        let opMarker = self.markers.filter { (elm) -> Bool in
            return elm.position.latitude == lat && elm.position.longitude == lon
        }.first
        if let marker = opMarker , let index = self.markers.lastIndex(of: marker) {
            carousel.scrollToItem(at: IndexPath(row: index, section: 0), at: .top, animated: true)
        }
        if opMarker != nil {
            //self.carousel.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredVertically, animated: true)
            self.markers.forEach { (elm) in
                elm.icon = UIImage(named: "pin-not-selected")
            }
            opMarker?.icon = UIImage(named: "pin-selected")
            self.mapView.selectedMarker = opMarker
            self.centerOnSelectedMarker()
        }
        return true
    }

}

extension MapViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.filtredPlaces.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let scalingCell = cell as? SearchCellMap {
            scalingCell.placeName.text = self.filtredPlaces[indexPath.row].name ?? ""
            scalingCell.descriptionUILabel.text = self.filtredPlaces[indexPath.row].description ?? ""
            let rate = Int(self.filtredPlaces[indexPath.row].stars ?? "0") ?? 0
            for i in 0...4 {
                (scalingCell.ratingStack.arrangedSubviews[i] as? UIImageView)?.image = UIImage(named: (i+1) > rate ? "star" : "star-activated")
            }
        }
        cell.isUserInteractionEnabled = false

        DispatchQueue.main.async {
            cell.setNeedsLayout()
            cell.layoutIfNeeded()
        }

        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if let collectionView = scrollView as? ScalingCarouselView {
            let index = collectionView.currentCenterCellIndex?.row ?? 0
            self.markers.forEach { (elm) in
                elm.icon = UIImage(named: "pin-not-selected")
            }
            self.markers[index].icon = UIImage(named: "pin-selected")
            self.mapView.selectedMarker = self.markers[index]
            self.centerOnSelectedMarker()
        }
    }
    
}


class SearchCellMap: ScalingCarouselCell {
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var ratingStack: UIStackView!
    @IBOutlet weak var descriptionUILabel: UILabel!

}

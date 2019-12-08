//
//  HomeViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/24/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import CoreLocation
class HomeViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var tableview : UITableView!
    
    // MARK: - Properties
    var headers = ["", "À la une", "Mon séjour", "Les incontournables"]
    var listEvents : [Event] = []
    var listSejours : [Sejour] = []
    var listIncontournables : [Incontournable] = []
    var location: CLLocationCoordinate2D! {
        didSet {
            Utils.reverseGeocodeLocation(latitude: location.latitude, longitude: location.longitude) { (adress) in
                APIService.getCurrentWeather(query: adress) { (weather, error) in
                    if error == nil {
                        self.weather = weather!
                        self.tableview.reloadSections([0], with: UITableView.RowAnimation.automatic)
                    }
                }
            }
        }
    }
    
    let locationManager = CLLocationManager()
    var weather: Weather!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.register(UINib(nibName: "SectionHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "SectionHeaderTableViewCell")
        self.tableview.register(UINib(nibName: "EmptyTableViewCell", bundle: nil), forCellReuseIdentifier: "EmptyTableViewCell")
        self.locationManager.requestAlwaysAuthorization()

        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        APIService.getListEvents { (list, error) in
            if error == nil {
                self.listEvents = list ?? []
                self.tableview.reloadSections([1], with: .automatic)
            }
        }
        
        APIService.getListSejour { (list, error) in
            if error == nil {
                self.listSejours = list ??  []
                self.tableview.reloadSections([2], with: .automatic)
            }
        }
        
        APIService.getListIncontournables { (list, error) in
            if error == nil {
                self.listIncontournables = list ??  []
                self.tableview.reloadSections([3], with: .automatic)
            }
        }
    }

}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        if self.location == nil {
            self.location = locValue
        }
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return headers.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let hasData = (indexPath.section == 1 && listEvents.count > 0) || (indexPath.section == 2 && listSejours.count > 0) || (indexPath.section == 3 && listIncontournables.count > 0)
            if headers[indexPath.section] != "" , hasData , let cell = tableView.dequeueReusableCell(withIdentifier: "SectionHeaderTableViewCell", for: indexPath) as? SectionHeaderTableViewCell {
                cell.initElements(title: headers[indexPath.section])
                return cell
            }
        default:
            switch indexPath.section {
            case 0:
                if weather != nil, let cell = tableView.dequeueReusableCell(withIdentifier: "weather", for: indexPath) as? WeatherTableViewCell{
                    cell.initElements(with: self.weather)
                    return cell
                }
            case 1:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "ListEventsTableViewCell", for: indexPath) as? ListEventsTableViewCell {
                    cell.events = self.listEvents
                    cell.selectItem = { index in
                        if let vc = self.storyboard?.instantiateViewController(identifier: "DetailEventViewController") as? DetailEventViewController {
                            vc.event = self.listEvents[index]
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                    return cell
                }
            case 3:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "UnavoidableTableViewCell", for: indexPath) as? UnavoidableTableViewCell {
                    cell.list = self.listIncontournables
                    cell.didSelected = { index in
                        if let vc = self.storyboard?.instantiateViewController(identifier: "DetailActivityViewController") as? DetailActivityViewController {
                            vc.incontournable = self.listIncontournables[index]
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                    return cell
                }
            default:
                if let cell = tableView.dequeueReusableCell(withIdentifier: "SejourTableViewCell", for: indexPath) as? SejourTableViewCell {
                    cell.list = self.listSejours
                    cell.initElements()
                    cell.didSelected = { index in
                        if let vc = self.storyboard?.instantiateViewController(identifier: "SejourDetailViewController") as? SejourDetailViewController {
                            vc.sejour = self.listSejours[index]
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                    return cell
                }
            }
            
        }
        return tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath)
    }
    
    
}

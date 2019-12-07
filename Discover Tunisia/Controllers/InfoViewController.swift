//
//  InfoViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit
import FSCalendar
import AFDateHelper

class InfoViewController: UIViewController {
    
    @IBOutlet weak var calendar : FSCalendar!
    @IBOutlet weak var tableView : UITableView!

    fileprivate let gregorian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian)
    var list : [Date: Int] = [:]
    var events : [EventCalendar] = []
    
    fileprivate let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMM yyyy"
        return formatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.calendar.select(Date(), scrollToDate: true)
        APIService.getCalendarEvents { (list, error) in
            self.events = list ?? []
            let allKeys = Set<String>(self.events.filter({!($0.date ?? "").isEmpty}).map{$0.date ?? ""})
            for key in allKeys {
                let sum = self.events.filter({($0.date ?? "") == key}).count
                self.list.updateValue(sum, forKey: Date(fromString: key, format: .custom("d MMM yyyy"))!)
            }
            self.calendar.reloadData()
        }
    }
    
    @IBAction func callPolice(){
        if let url = URL(string: "tel://197") {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func callAmbilance(){
        if let url = URL(string: "tel://190") {
            UIApplication.shared.openURL(url)
        }
    }
    
    @IBAction func callTaxi(){
        if let url = URL(string: "tel://71837083") {
            UIApplication.shared.openURL(url)
        }
    }
    
    

}

extension InfoViewController : FSCalendarDataSource, FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return list[date] ?? 0
    }
    
    func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
        print("change page to \(self.formatter.string(from: calendar.currentPage))")
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        if monthPosition == .previous || monthPosition == .next {
            calendar.setCurrentPage(date, animated: true)
        }
        self.tableView.reloadData()
    }
    
}

extension InfoViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if calendar.selectedDate != nil {
             return list[calendar.selectedDate!] ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if let date = self.calendar.selectedDate {
            let elms = self.events.filter({($0.date ?? "") ==  self.formatter.string(from: date)})
            if elms.count > indexPath.row, let text = cell.viewWithTag(1000) as? UILabel {
                text.text = elms[indexPath.row].description ?? ""
            }
        }
        return cell
    }
    
    
}

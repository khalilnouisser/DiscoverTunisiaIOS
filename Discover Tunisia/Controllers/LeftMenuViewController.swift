//
//  LeftMenuViewController.swift
//  Discover Tunisia
//
//  Created by Khalil nouisser on 11/25/19.
//  Copyright © 2019 Streamerz. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userDescription: UILabel!
    @IBOutlet weak var userUIStackView: UIStackView!
    @IBOutlet weak var tableView: UITableView!

    var list = ["À la une","Actualités","Mon séjour","Les incontournables","Paramètres"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.allowsSelection = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadItems()
    }
    
    func loadItems(){
        loginButton.isHidden = AuthService.connectedUser != nil
        userUIStackView.isHidden = AuthService.connectedUser == nil
        if let user = AuthService.connectedUser {
            userImage.setImage(url: user.userImage, defaultImage: "user-image")
            coverImage.setImage(url: user.avatar, defaultImage: "")
            userName.text = user.name ?? ""
            userDescription.text = user.email ?? ""
            if list.count == 5 {
                list.append("Déconnexion")
                tableView.reloadData()
            }
        } else {
            if list.count ==  6 {
                list = list.dropLast()
                tableView.reloadData()
            }
        }
    }
    
    @IBAction func closeMenu(){
        self.panel?.closeLeft()
    }
    
    @IBAction func goToLogin(){
        if let vc = self.storyboard?.instantiateViewController(identifier: "LoginViewController") {
            self.panel?.closeLeft()
            self.parent?.navigationController?.pushViewController(vc, animated: true)
        }
    }

}

extension LeftMenuViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menu_cell", for: indexPath)
        cell.selectionStyle = .none
        if let text = cell.viewWithTag(1000) as? UILabel {
            text.text = list[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 5:
            AuthService.connectedUser = nil
            loadItems()
        default:
            break
        }
    }
    
    
}
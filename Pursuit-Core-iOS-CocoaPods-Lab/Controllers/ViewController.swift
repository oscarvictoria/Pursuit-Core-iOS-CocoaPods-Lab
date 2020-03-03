//
//  ViewController.swift
//  Pursuit-Core-iOS-CocoaPods-Lab
//
//  Created by Oscar Victoria Gonzalez  on 3/3/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstView = mainView()
    
    var randomUsers = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.firstView.tableView.reloadData()
            }
        }
    }
    
    override func loadView() {
        view = firstView
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        configureTableView()
        fetchUsers()
    }

    private func configureTableView() {
        firstView.tableView.dataSource = self
        firstView.tableView.delegate = self
        firstView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "userCell")
        
    }
    
    private func fetchUsers() {
        APIClient.getUsers { (result) in
            switch result {
            case .failure(let appError):
                print("app Error \(appError)")
            case .success(let user):
                self.randomUsers = user
            }
        }
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        cell = UITableViewCell(style: .subtitle, reuseIdentifier: "userCell")
        let users = randomUsers[indexPath.row]
        cell.textLabel?.text = "\(users.name.first) \(users.name.last)"
        cell.detailTextLabel?.text = users.email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let users = randomUsers[indexPath.row]
        let detailVC = DetailViewController()
        detailVC.users = users
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}

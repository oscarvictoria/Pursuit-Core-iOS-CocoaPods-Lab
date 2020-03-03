//
//  DetailViewController.swift
//  Pursuit-Core-iOS-CocoaPods-Lab
//
//  Created by Oscar Victoria Gonzalez  on 3/3/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var users: User?
    
    var detailView = DetailView()
    
    override func loadView() {
        view = detailView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        updateUI()
    }
    
    public func updateUI() {
        guard let user = users else {
            fatalError("could not get users")
        }
        detailView.adressLabel.text = "\(user.location.city), \(user.location.state)"
        detailView.phoneLabel.text = "Phone: \(user.phone.description)"
        detailView.dobLabel.text = """
DOB: \(user.dob.date)
Age: \(user.dob.age)
"""
    }
    

    

}

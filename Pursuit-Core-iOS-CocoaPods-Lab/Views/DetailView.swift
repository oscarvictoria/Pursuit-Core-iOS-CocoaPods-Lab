//
//  DetailView.swift
//  Pursuit-Core-iOS-CocoaPods-Lab
//
//  Created by Oscar Victoria Gonzalez  on 3/3/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIView {

    public lazy var adressLabel: UILabel = {
        let label = UILabel()
        label.text = "Adress Label"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Label"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    public lazy var dobLabel: UILabel = {
        let label = UILabel()
        label.text = "DOB label"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder:coder)
        commonInit()
    }
    
    private func commonInit() {
        configureAdressLabel()
        configurePhoneLabel()
        configureDOBLabel()
    }
    
    private func configureAdressLabel() {
        addSubview(adressLabel)
        adressLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
    }
    
    private func configurePhoneLabel() {
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self.adressLabel).inset(60)
        }
    }
    
    private func configureDOBLabel() {
        addSubview(dobLabel)
        dobLabel.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalTo(self.phoneLabel).inset(60)
        }
    }
    
    
}




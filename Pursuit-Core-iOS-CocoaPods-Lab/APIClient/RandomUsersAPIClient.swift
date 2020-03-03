//
//  RandomUsersAPIClient.swift
//  Pursuit-Core-iOS-CocoaPods-Lab
//
//  Created by Oscar Victoria Gonzalez  on 3/3/20.
//  Copyright © 2020 Oscar Victoria Gonzalez . All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
    static func getUsers(completion: @escaping (AFResult <[User]>)->()) {
        
        let endpointURL = "https://randomuser.me/api/?results=50"
        
        guard let url = URL(string: endpointURL) else {
            return
        }
        
        AF.request(url).response { (response) in
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    completion(.success(results.results))
                } catch {
                    print("error")
                }
            }
        }
    }
}

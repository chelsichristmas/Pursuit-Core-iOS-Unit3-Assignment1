//
//  UserInformation.swift
//  PeopleAndAppleStockPrices
//
//  Created by Chelsi Christmas on 12/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

class UserInformation: Decodable {
    var results: [Info]
}

class Info: Decodable {
    var name: Name
    var location: Location
    var email: Srtring
    var dob: String
    var cell: String
    var picture: Picture
    
    func fullName(user: Info) -> String {
        let fullName = "\(user.name.title.capitalized).  \(user.name.first.capitalized) \(user.name.last.capitalized)"
        
        return fullName
    }
    func fullAddress(user: Info) -> String {
        let fullAddress = "\(user.location.street) \(user.location.city) \(user.location.city), \(user.location.state) \(user.location.postcode)"
        return fullAddress
    }
}

class Name: Decodable {
    var title: String
    var first: String
    var last : String
    
    
}

class Location: Decodable {
    var street: String
    var city: String
    var state: String
    var postcode: String
}

class Picture: Decodable {
    var large: String
}

extension UserInformation {
    
    
    static func getUserInfo() -> [Info] {
        var info = [Info]()
        guard let fileURL = Bundle.main.url(forResource: "userinfo", withExtension: "json") else {
            fatalError("unable to access userinfo.json")
        }
        
        do {
            let data = try Data.init(contentsOf: fileURL)
            let userData = try JSONDecoder().decode(UserInformation.self, from: data)
            info = userData.results.sorted{$0.name.last < $1.name.last}
            
        } catch {
            fatalError("Unable to decode userinfo.json file")
        }
        
        return info
    }
}

//
//  ApiResponse.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/19/23.
//

import UIKit

struct APIResponse: Codable {
    let results: [User]
}

struct User: Codable {
    //Required
    let name: Name
    let picture: Picture
      
    //Optional
    var gender: String
    var email: String
    var dateOfBirth: DateOfBirth
    var login: Login
    var homeNumber: String
    var cellNumber: String
    
    enum CodingKeys: String, CodingKey {
        //changes
        case dateOfBirth = "dob"
        case homeNumber = "phone"
        case cellNumber = "cell"
        
        //no change
        case name
        case picture
        case gender
        case email
        case login
    }
    
}

struct Name: Codable {
    let first: String
    let last: String
}

struct Picture: Codable {
    let thumbnail: String
}

struct DateOfBirth: Codable {
    let date: String
    let age: Int
}

struct Login: Codable {
    let uuid: UUID
    let username: String
    let password: String
}

//
//  User.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/17/23.
//

import UIKit

struct FormattedUser {
    //required
    var fullName: String
    var pictureURL: String
    
    //optional
    var age: Int?
    var birthday: String?
    var uuid: UUID?
    var username: String?
    var password: String?
    
    //direct pass optional
    var gender: String?
    var email: String?
    var homeNumber: String?
    var cellNumber: String?
}

extension APIResponse {
    func extractUser(at index: Int = 0) -> FormattedUser {
        let oldUser = self.results[index]
        
        let newUser = FormattedUser(
            fullName: "\(oldUser.name.first) \(oldUser.name.last)",
            pictureURL: oldUser.picture.thumbnail,
            age: oldUser.dateOfBirth.age,
            birthday: formatBirthday(birthdayString: oldUser.dateOfBirth.date),
            uuid: oldUser.login.uuid,
            username: oldUser.login.username,
            password: oldUser.login.password,
            gender: oldUser.gender,
            email: oldUser.email,
            homeNumber: oldUser.homeNumber,
            cellNumber: oldUser.cellNumber
        )
        
        func formatBirthday(birthdayString: String) -> String {
            //Convert string to date
            let dateFormatter = ISO8601DateFormatter()
            dateFormatter.formatOptions = [.withFullDate] // Added format options
            guard let date = dateFormatter.date(from: birthdayString) else {
                return "date is nil."
            }
            
            //return formatted date string
            return date.formatted(date: .long, time: .omitted)
        }
        return newUser
    }
}

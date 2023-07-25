//
//  UserTable.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/17/23.
//

import UIKit

class UserTable: UITableViewController {

    var generationController = GenerationController()
    var users: [FormattedUser] {
        return [FormattedUser(fullName: "Test Person", pictureURL: "https://randomuser.me/api/portraits/thumb/women/62.jpg", age: 20, birthday: "1945-02-16T10:35:49.300Z", uuid: UUID(uuidString: "e70c5132-84e8-4317-829d-f10da3b180ef"), username: "Tester_Gal", password: "NeverEnoughBaby", gender: "Female", email: "email@email.com", homeNumber: "(123) 456-7890", cellNumber: "(098) 765-4321"), FormattedUser(fullName: "Test Person2", pictureURL: "https://randomuser.me/api/portraits/thumb/women/62.jpg", age: 20, birthday: "1945-02-16T10:35:49.300Z", uuid: UUID(uuidString: "e70c5132-84e8-4317-829d-f10da3b180ef"), username: "Tester_Gal2", password: "SetItAllFreeBaby", gender: "Female", email: "email2@email.com", homeNumber: "(123) 456-7890", cellNumber: "(098) 765-4321")]
    }
    var usersLoaded = false
    
    var numberOfUsers = 0
    var showGender = true
    var showEmail = true
    var showAge = true
    var showBirthday = true
    
    var numberOfAttributes = 3
    var usedCells = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if showGender == true {
            numberOfAttributes += 1
        }
        if showEmail == true {
            numberOfAttributes += 1
        }
        if showAge == true {
            numberOfAttributes += 1
        }
        if showBirthday == true {
            numberOfAttributes += 1
        }
        
        //generateUsers()
    }
    
//    func generateUsers() {
//        Task {
//            do {
//                let generatorResponse = try await generationController.generateUsers(count: numberOfUsers)
//                for index in (0...generatorResponse.results.count - 1) {
//                    users.append(generatorResponse.extractUser(at: index))
//                }
//                usersLoaded = true
//                tableView.reloadData()
//            } catch {
//                print(error)
//            }
//        }
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if usersLoaded == false {
            return 2 //0
        } else {
            return numberOfUsers
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return users[section].fullName
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfAttributes
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.section]
        
        if indexPath.row == 0 { //First, always MainCell
            usedCells = []
            
            let cell = configureCell(identifier: "MainCell", indexPath: indexPath) as! MainCell
            cell.update(with: user)
            return cell
        } else if indexPath.row == numberOfAttributes - 2 { //Second last, always LoginCell
            let cell = configureCell(identifier: "LoginCell", indexPath: indexPath) as! LoginCell
            cell.update(with: user)
            return cell
        } else if indexPath.row == numberOfAttributes - 1 { //Last, always PhoneCell
            let cell = configureCell(identifier: "PhoneCell", indexPath: indexPath) as! PhoneCell
            cell.update(with: user)
            return cell
        } else {
            if showGender == true, !usedCells.contains("GenderCell") {
                usedCells.append("GenderCell")
                
                let cell = configureCell(identifier: "GenderCell", indexPath: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = user.gender?.capitalized
                cell.contentConfiguration = content
                return cell
            } else if showEmail == true, !usedCells.contains("EmailCell") {
                usedCells.append("EmailCell")
                
                let cell = configureCell(identifier: "EmailCell", indexPath: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "Contact: \(user.email ?? "No email provided.")"
                cell.contentConfiguration = content
                return cell
            } else if showAge == true, !usedCells.contains("AgeCell") {
                usedCells.append("AgeCell")
                
                let cell = configureCell(identifier: "AgeCell", indexPath: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "\(user.age?.description ?? "No age provided.") years old"
                cell.contentConfiguration = content
                return cell
            } else if showBirthday == true, !usedCells.contains("BirthdayCell") {
                usedCells.append("BirthdayCell")
                
                let cell = configureCell(identifier: "BirthdayCell", indexPath: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "Born \(user.birthday ?? "No birthday provided.")"
                cell.contentConfiguration = content
                return cell
            }
        }
        print("\n\nHow did it come to this?\n\n")
        return UITableViewCell()
    }
    
    func configureCell(identifier: String, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        return cell
    }

}

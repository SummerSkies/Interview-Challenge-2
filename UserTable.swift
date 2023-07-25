//
//  UserTable.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/17/23.
//

import UIKit

class UserTable: UITableViewController {

    var generationController = GenerationController()
    var users: [FormattedUser] = []
    var usersLoaded = false
    
    var numberOfUsers = 0
    var showGender = true
    var showEmail = true
    var showAge = true
    var showBirthday = true
    
    var numberOfAttributes = 1
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
        
        generateUsers()
    }
    
    func generateUsers() {
        Task {
            do {
                let generatorResponse = try await generationController.generateUsers(count: numberOfUsers)
                for index in (0...generatorResponse.results.count - 1) {
                    users.append(generatorResponse.extractUser(at: index))
                }
                usersLoaded = true
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        if usersLoaded == false {
            return 0
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
        print("\n\nExtra Cell Generated.\n\n")
        return UITableViewCell()
    }
    
    func configureCell(identifier: String, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        return cell
    }

}

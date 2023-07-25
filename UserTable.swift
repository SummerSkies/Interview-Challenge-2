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

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = users[indexPath.section]
        
        switch indexPath.row {
        case 0:
            let cell = configureCell(identifier: "MainCell", indexPath: indexPath) as! MainCell
            cell.update(with: user)
            return cell
        case 1:
            let cell = configureCell(identifier: "GenderCell", indexPath: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = user.gender?.capitalized
            cell.contentConfiguration = content
            return cell
        case 2:
            let cell = configureCell(identifier: "EmailCell", indexPath: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "Contact: \(user.email ?? "No email provided.")"
            cell.contentConfiguration = content
            return cell
        case 3:
            let cell = configureCell(identifier: "AgeCell", indexPath: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "\(user.age?.description ?? "No age provided.") years old"
            cell.contentConfiguration = content
            return cell
        case 4:
            let cell = configureCell(identifier: "BirthdayCell", indexPath: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "Born \(user.birthday ?? "No birthday provided.")"
            cell.contentConfiguration = content
            return cell
        case 5:
            let cell = configureCell(identifier: "LoginCell", indexPath: indexPath) as! LoginCell
            cell.update(with: user)
            return cell
        case 6:
            let cell = configureCell(identifier: "PhoneCell", indexPath: indexPath) as! PhoneCell
            cell.update(with: user)
            return cell
        default:
            print("This should be impossible.")
            return UITableViewCell()
        }
    }
    
    func configureCell(identifier: String, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

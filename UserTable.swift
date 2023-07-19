//
//  UserTable.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/17/23.
//

import UIKit

class UserTable: UITableViewController {

    var generationController = GenerationController()
    var printReadyUser: FormattedUser?
    var usersLoaded = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                let testResponse = try await generationController.generateUser()
                let testUser = testResponse.extractUser()
                printReadyUser = testUser
                usersLoaded = true
                tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if usersLoaded == false {
            return 0
        } else {
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let printReadyUser {
            switch indexPath.row {
            case 0:
                let cell = configureCell(identifier: "MainCell", indexPath: indexPath) as! MainCell
                cell.update(with: printReadyUser)
                return cell
            case 1:
                let cell = configureCell(identifier: "GenderCell", indexPath: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = printReadyUser.gender?.capitalized
                cell.contentConfiguration = content
                return cell
            case 2:
                let cell = configureCell(identifier: "EmailCell", indexPath: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "Contact: \(printReadyUser.email ?? "No email provided.")"
                cell.contentConfiguration = content
                return cell
            case 3:
                let cell = configureCell(identifier: "AgeCell", indexPath: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "\(printReadyUser.age?.description ?? "No age provided.") years old"
                cell.contentConfiguration = content
                return cell
            case 4:
                let cell = configureCell(identifier: "BirthdayCell", indexPath: indexPath)
                var content = cell.defaultContentConfiguration()
                content.text = "Born \(printReadyUser.birthday ?? "No birthday provided.")"
                cell.contentConfiguration = content
                return cell
            case 5:
                let cell = configureCell(identifier: "LoginCell", indexPath: indexPath) as! LoginCell
                cell.update(with: printReadyUser)
                return cell
            case 6:
                let cell = configureCell(identifier: "PhoneCell", indexPath: indexPath) as! PhoneCell
                cell.update(with: printReadyUser)
                return cell
            default:
                print("This should be impossible.")
                return tableView.dequeueReusableCell(withIdentifier: "Not Valid", for: indexPath)
            }
        }
        return UITableViewCell()
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

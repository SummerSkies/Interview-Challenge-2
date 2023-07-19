//
//  GenerationSettingsView.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/17/23.
//

import UIKit

class GenerationSettingsView: UIViewController {
    @IBOutlet weak var testImageView: UIImageView!
    
    var generationController = GenerationController()
    var printReadyUser: FormattedUser?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            do {
                let testResponse = try await generationController.generateUser()
                let testUser = testResponse.extractUser()
                getImage(pictureURL: testUser.pictureURL)
                printReadyUser = testUser
                printUser()
            } catch {
                print(error)
            }
        }
    }
    
    func printUser() {
        if let printReadyUser {
            print("""
            User:
                    \(printReadyUser.fullName)
                    \(printReadyUser.age ?? 0) year old \(printReadyUser.gender ?? "nil gender")
                    Born on \(printReadyUser.birthday ?? "nil birthday")
                    \(printReadyUser.email ?? "nil email")
            
                    UUId: \(printReadyUser.uuid ?? UUID())
                    Generic UUID: \(UUID())
                    Username: \(printReadyUser.username ?? "nil username")
                    Password: \(printReadyUser.password ?? "nil password")
                    Cell: \(printReadyUser.cellNumber ?? "nil cell")
                    Home: \(printReadyUser.homeNumber ?? "nil home")
            
            """)
            print("Image successfully loaded.")
        } else {
            print("User 'printReadyUser' is nil.")
        }
    }
    
    func getImage(pictureURL: String) {
        if let url = URL(string: pictureURL) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async { /// execute on main thread
                    self.testImageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

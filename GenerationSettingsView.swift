//
//  GenerationSettingsView.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/17/23.
//

import UIKit

class GenerationSettingsView: UIViewController {
    @IBOutlet weak var userNumberLabel: UILabel!
    @IBOutlet weak var userNumberStepper: UIStepper!
    @IBOutlet weak var genderCheckbox: UIButton!
    @IBOutlet weak var emailCheckbox: UIButton!
    @IBOutlet weak var ageCheckbox: UIButton!
    @IBOutlet weak var birthdayCheckbox: UIButton!
    
    var numberOfUsers = 0 {
        didSet {
            print(numberOfUsers)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        guard let numberOfUsers = userNumberLabel.text else { return userNumberLabel.text = "0" }
        guard let currentNumberOfUsers = Int(numberOfUsers) else { return userNumberLabel.text = "0" }
        
        var previousStepperValue = self.numberOfUsers
        
        if userNumberStepper.value > Double(previousStepperValue) {
            userNumberStepper.value = Double(currentNumberOfUsers) + userNumberStepper.stepValue
            userNumberLabel.text = String(Int(userNumberStepper.value))
        } else {
            userNumberStepper.value = Double(currentNumberOfUsers) - userNumberStepper.stepValue
            userNumberLabel.text = String(Int(userNumberStepper.value))
        }
        self.numberOfUsers = Int(userNumberStepper.value)
        return
   }
}

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
    @IBOutlet weak var generateButton: UIButton!
    
    var numberOfUsers = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateGenerateButtonState() {
        if numberOfUsers == 0 {
            generateButton.isEnabled = false
        } else {
            generateButton.isEnabled = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        guard let numberOfUsers = userNumberLabel.text else { return userNumberLabel.text = "0" }
        guard let currentNumberOfUsers = Int(numberOfUsers) else { return userNumberLabel.text = "0" }
        
        let previousStepperValue = self.numberOfUsers
        
        if userNumberStepper.value > Double(previousStepperValue) {
            userNumberStepper.value = Double(currentNumberOfUsers) + userNumberStepper.stepValue
            userNumberLabel.text = String(Int(userNumberStepper.value))
        } else {
            userNumberStepper.value = Double(currentNumberOfUsers) - userNumberStepper.stepValue
            userNumberLabel.text = String(Int(userNumberStepper.value))
        }
        
        self.numberOfUsers = Int(userNumberStepper.value)
        updateGenerateButtonState()
        
        return
    }
    
    @IBSegueAction func generateUsers(_ coder: NSCoder, sender: Any?) -> UserTable? {
        let destinationView = UserTable(coder: coder)
        
        //destinationView?.numberOfUsers = numberOfUsers

        return destinationView
    }
}

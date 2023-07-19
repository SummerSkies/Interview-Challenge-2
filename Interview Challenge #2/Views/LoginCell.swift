//
//  LoginCell.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/19/23.
//

import UIKit

class LoginCell: UITableViewCell {
    @IBOutlet weak var uuidLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with user: FormattedUser) {
        uuidLabel.text = user.uuid?.uuidString
        usernameLabel.text = user.username
        passwordLabel.text = user.password
    }
}

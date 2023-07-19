//
//  PhoneCell.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/19/23.
//

import UIKit

class PhoneCell: UITableViewCell {
    @IBOutlet weak var homeNumberLabel: UILabel!
    @IBOutlet weak var cellNumberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func update(with user: FormattedUser) {
        homeNumberLabel.text = user.homeNumber
        cellNumberLabel.text = user.cellNumber
    }
}

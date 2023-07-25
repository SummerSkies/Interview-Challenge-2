//
//  MainCell.swift
//  Interview Challenge #2
//
//  Created by Juliana Nielson on 7/19/23.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with user: FormattedUser) {
        userNameLabel.text = user.fullName
        //getImage(pictureURL: user.pictureURL)
    }
    
    func getImage(pictureURL: String) {
        if let url = URL(string: pictureURL) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    self.profilePictureImageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
    }

}

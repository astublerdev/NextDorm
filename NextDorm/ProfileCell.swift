//
//  ProfileCell.swift
//  NextDorm
//
//  Created by Anna S on 5/2/22.
//

import UIKit

class ProfileCell: UITableViewCell {

    
    
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var preferredHousing: UILabel!
    
    @IBOutlet weak var bio: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  GeneralPostCell.swift
//  NextDorm
//
//  Created by Daisy Rocha on 4/26/22.
//

import UIKit

class GeneralPostCell: UITableViewCell {
    
    
    @IBOutlet weak var photoView: UIImageView!
    
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    
    @IBOutlet weak var desciptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

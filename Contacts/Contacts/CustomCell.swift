//
//  CustomCell.swift
//  Contacts
//
//  Created by Madina Amantayeva on 11.02.2021.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var contactImageView: UIImageView!
    
    @IBOutlet weak var contactName: UILabel!
    
    @IBOutlet weak var contactNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

//
//  ContactTableViewCell.swift
//  ContactsApp
//
//  Created by Will Wyatt on 11/23/15.
//  Copyright © 2015 Will Wyatt. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    //IBOutlets
    @IBOutlet weak var contactImage: UIImageView!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

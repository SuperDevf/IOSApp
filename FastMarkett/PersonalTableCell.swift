//
//  PersonalTableCell.swift
//  FastMarkett
//
//  Created by Nicholas Raphael Farias  on 5/15/15.
//  Copyright (c) 2015 Nicholas Raphael Farias . All rights reserved.
//

import UIKit

class PersonalTableCell: UITableViewCell {

    
    @IBOutlet weak var personalProductName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
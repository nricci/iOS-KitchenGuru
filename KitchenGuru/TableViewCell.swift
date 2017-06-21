//
//  TableViewCell.swift
//  KitchenGuru
//
//  Created by Nicolas Ricci on 20/6/17.
//  Copyright © 2017 Nicolas Ricci. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var mealdescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

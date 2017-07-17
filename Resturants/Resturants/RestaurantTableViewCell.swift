//
//  RestaurantTableViewCell.swift
//  tableview
//
//  Created by jay patel on 2017-04-07.
//
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
   
    @IBOutlet weak var restimg: UIImageView!
    
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var custnam: UILabel!
    
    @IBOutlet weak var lblname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

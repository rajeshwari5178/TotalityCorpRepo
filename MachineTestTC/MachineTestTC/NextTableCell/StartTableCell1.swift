//
//  StartTableCell1.swift
//  MachineTestTC
//
//  Created by Rajeshwari Sharma on 17/08/23.
//

import UIKit

class StartTableCell1: UITableViewCell {
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var Cancel: UIButton!
    @IBOutlet weak var headerlbl: UILabel!
    @IBOutlet weak var readmoreview: UITextView!
    
    @IBOutlet weak var readmorebutton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

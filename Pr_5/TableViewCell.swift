//
//  TableViewCell.swift
//  Pr_5
//
//  Created by R86 on 24/03/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lable1: UILabel!
    @IBOutlet weak var lable2: UILabel!
    @IBOutlet weak var lable3: UILabel!
    @IBOutlet weak var lable4: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

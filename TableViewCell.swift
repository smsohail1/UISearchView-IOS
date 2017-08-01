//
//  TableViewCell.swift
//  UISearchControllerIos
//
//  Created by Abdul Ahad on 7/31/17.
//  Copyright © 2017 plash. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var size: UITextView!
    @IBOutlet weak var name: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

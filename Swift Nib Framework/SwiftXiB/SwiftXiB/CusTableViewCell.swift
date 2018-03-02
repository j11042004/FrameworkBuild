//
//  CusTableViewCell.swift
//  SwiftXiB
//
//  Created by Uran on 2018/2/27.
//  Copyright © 2018年 Uran. All rights reserved.
//

import UIKit

class CusTableViewCell: UITableViewCell {

    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

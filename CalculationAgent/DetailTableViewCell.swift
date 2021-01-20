//
//  DetailTableViewCell.swift
//  CalculationAgent
//
//  Created by Dan on 2018/6/17.
//  Copyright © 2018年 Dan. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell
{
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet var numberOfMonth: UILabel!
    @IBOutlet var principal: UILabel!
    @IBOutlet var interset: UILabel!
    @IBOutlet var principalBalance: UILabel!
}

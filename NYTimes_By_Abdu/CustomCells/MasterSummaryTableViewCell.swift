//
//  MasterSummaryTableViewCell.swift
//  NY Times Most Popular Articles
//
//  Created by Abdul Nasir B A on 14/1/19.
//  Copyright © 2019 Abdul Nasir B A. All rights reserved.
//

import UIKit

class MasterSummaryTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    @IBOutlet weak var publishDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

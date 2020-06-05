//
//  CountriesViewCell.swift
//  covid19statisticsApp
//
//  Created by Duale on 6/3/20.
//  Copyright © 2020 Duale. All rights reserved.
//

import UIKit

class CountriesViewCell: UITableViewCell {

    @IBOutlet weak var countryname: UILabel!
    @IBOutlet weak var countryimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

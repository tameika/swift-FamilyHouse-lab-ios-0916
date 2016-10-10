//
//  FilmLocationTableViewCell.swift
//  FamilyHouse
//
//  Created by James Campagno on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewCell: UITableViewCell {
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var filmTVSeriesLabel: UILabel!
    @IBOutlet weak var filmAddressLabel: UILabel!
    
    var filmLocation: FilmLocation! {
        didSet {
            filmNameLabel.text = filmLocation.name
            filmTVSeriesLabel.text = filmLocation.tvSeries.description
            filmAddressLabel.text = filmLocation.address
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

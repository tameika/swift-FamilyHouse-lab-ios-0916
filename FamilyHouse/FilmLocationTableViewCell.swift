//
//  FilmLocationTableViewCell.swift
//  FamilyHouse
//
//  Created by Tameika Lawrence on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var tvSeriesLabel: UILabel!
    
    
    var filmLocation: Filmlocation! {
        didSet {
            nameLabel.text = filmLocation.name
            addressLabel.text = filmLocation.address
            tvSeriesLabel.text = filmLocation.tvSeries.description 
            
        }
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

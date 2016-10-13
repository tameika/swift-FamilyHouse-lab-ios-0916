//
//  CharacterCollectionViewCell.swift
//  FamilyHouse
//
//  Created by Tameika Lawrence on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
    
class CharacterCollectionViewCell: UICollectionViewCell {
    
        @IBOutlet weak var characterImageView: UIImageView!
    
        @IBOutlet weak var characterNameLabel: UILabel!
        
        var character: Character! {
            didSet {
                characterNameLabel.text = character.name
                characterImageView.image = character.image
             
        }
        
    }
    
    
}

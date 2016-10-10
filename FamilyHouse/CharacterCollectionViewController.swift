//
//  CharacterCollectionViewController.swift
//  FamilyHouse
//
//  Created by James Campagno on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

private let reuseIdentifier = "CharacterCell"

class CharacterCollectionViewController: UICollectionViewController {
    
    var characters: [Character]!
    var filmLocation: FilmLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generateCharacters()
        collectionView?.allowsMultipleSelection = true
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        print("Done Tapped.")
        
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CharacterCollectionViewCell
        let character = characters[indexPath.row]
        cell.character = character
        return cell
    }
    
    func generateCharacters() {
        let location = FilmLocation(name: "NYC", address: "Lala", tvSeries: .familyMatters)
        let waldo = Character(name: "Waldo", realLifeName: "John", tvSeries: .familyMatters, currentLocation: location, image: #imageLiteral(resourceName: "Waldo"))
        characters = [waldo]
        
    }
    
    // MARK: UICollectionViewDelegate
    
    
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    //    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    //        return true
    //    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! CharacterCollectionViewCell
        if selectedCell.layer.borderColor == UIColor.blue.cgColor {
            selectedCell.layer.borderWidth = 0.0
            selectedCell.layer.borderColor = UIColor.clear.cgColor
        } else {
            selectedCell.layer.borderWidth = 4.0
            selectedCell.layer.borderColor = UIColor.blue.cgColor
        }
    }
    
    
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}

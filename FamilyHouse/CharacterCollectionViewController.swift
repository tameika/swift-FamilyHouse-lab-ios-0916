//
//  CharacterCollectionViewController.swift
//  FamilyHouse
//
//  Created by Tameika Lawrence on 10/11/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class CharacterCollectionViewController: UICollectionViewController {
    
    
    
    var characters: [Character]!
    var filmLocation: Filmlocation!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        createCharacter()
        collectionView?.allowsMultipleSelection = true 

    }
    
    
    func createCharacter() {
        
        let carl = Character(name: "Carl Winslow", realLifeName: "Reginald VelJohnson", tvSeries: .familyMatters, currentLocation: Filmlocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "carl"))
        
        let danny = Character(name: "Danny Tanner", realLifeName: "Bob Saget", tvSeries: .fullHouse, currentLocation: Filmlocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "danny"))
        
        let eddie = Character(name: "Eddie Winslow", realLifeName: "Darius McCrary", tvSeries: .familyMatters, currentLocation: Filmlocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "eddie"))
        
        let jesse = Character(name: "Jesse Katsopolis", realLifeName: "John Stamos", tvSeries: .fullHouse, currentLocation: Filmlocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "jesse"))
        
        let joey = Character(name: "Joey Gladstone", realLifeName: "Dave Coulier", tvSeries: .fullHouse, currentLocation: Filmlocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "joey"))
        
        let kimmy = Character(name: "Kimmy Gibbler", realLifeName: "Andrea Barber", tvSeries: .fullHouse, currentLocation: Filmlocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "kimmy"))
        
        let laura = Character(name: "Laura Winslow", realLifeName: "Kallier Shanygne", tvSeries: .familyMatters, currentLocation: Filmlocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "laura"))
        
        let michelle = Character(name: "Michelle Tanner", realLifeName: "Mary-Kate Olsen", tvSeries: .fullHouse, currentLocation: Filmlocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "michelle"))
        
        let rebecca = Character(name: "Rebecca Katsopolis", realLifeName: "Lori Loughlin", tvSeries: .fullHouse, currentLocation: Filmlocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "rebecca"))
        
        let stephanie = Character(name: "Stephanie Tanner", realLifeName: "Jodie Sweetin", tvSeries: .fullHouse, currentLocation: Filmlocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: .fullHouse), image: #imageLiteral(resourceName: "stephanie"))
        
        let steve = Character(name: "Steve Urkel", realLifeName: "Jaleel White", tvSeries: .familyMatters, currentLocation: Filmlocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "steve"))
        
        let waldo = Character(name: "Waldo Geraldo Faldo", realLifeName: "Shawn Harrison", tvSeries: .familyMatters, currentLocation: Filmlocation(name: "Hollywood", address: "Burbank California", tvSeries: .familyMatters), image: #imageLiteral(resourceName: "Waldo"))
        
        characters = [carl, danny, eddie, jesse, joey, kimmy, laura, michelle, rebecca, stephanie, steve, waldo]
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return characters.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as! CharacterCollectionViewCell
    
        let character = characters[indexPath.row]
        
        cell.character = character
        
        // Configure the cell
    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CharacterCollectionViewCell

        cell.characterImageView.alpha = 0.5
        
        
    }
    
    
    @IBAction func charactersSelectedBtn(_ sender: UIBarButtonItem) {
        
        for personCell in (collectionView?.indexPathsForSelectedItems)! {
            if characters[personCell.item].canReportToSet(on: filmLocation) == true {
                print("\(characters[personCell.item].name) is allowed on set.")
                
            } else {
                print("\(characters[personCell.item].name) is not allowed on set.")
            }
            
        }
    }
    

   
}

//
//  FilmLocationTableTableViewController.swift
//  FamilyHouse
//
//  Created by Tameika Lawrence on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewController: UITableViewController {
    
    var filmLocations: [Filmlocation]!
    
//    @IBOutlet var tableVIEW: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFakeFilmLocation()
        tableView.reloadData()
        print(1)
        print(tableView)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func createFakeFilmLocation() {
        let MGM = Filmlocation(name: "Warner Bros Studios", address: "Los Angeles, California", tvSeries: TVSeries.fullHouse)
        let Warner = Filmlocation(name: "Hollywood", address: "Burbank California", tvSeries: TVSeries.familyMatters)
        filmLocations = [MGM, Warner]
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmLocations.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTv", for: indexPath) as? FilmLocationTableViewCell
        
        
        let filmIndex = filmLocations[indexPath.row]
        cell?.filmLocation = filmIndex
        return cell!
    
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterSegue" {
            if let destination = segue.destination as? CharacterCollectionViewController,
                let index = tableView.indexPathForSelectedRow {
                destination.filmLocation = filmLocations[index.row]
            }
            
        }
        
    }
    
    
    
}

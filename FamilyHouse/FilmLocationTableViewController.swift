//
//  FilmLocationTableViewController.swift
//  FamilyHouse
//
//  Created by James Campagno on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class FilmLocationTableViewController: UITableViewController {
    
    var filmLocations: [FilmLocation]!

    override func viewDidLoad() {
        super.viewDidLoad()
        generateFilmLocationData()
        tableView.reloadData()
    }


    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmLocations.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmLocationCell", for: indexPath) as! FilmLocationTableViewCell
        let filmLocation = filmLocations[indexPath.row]
        cell.filmLocation = filmLocation
        return cell
    }
    
    func generateFilmLocationData() {
        let nyc = FilmLocation(name: "New York City", address: "105 Fun Lane, New York NY 11201", tvSeries: .familyMatters)
        let la = FilmLocation(name: "Los Angeles", address: "12 Fruitloop Drive", tvSeries: .fullHouse)
        
        filmLocations = [nyc, la]
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}

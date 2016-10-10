//
//  Character.swift
//  FamilyHouse
//
//  Created by James Campagno on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

struct Character {
    let name: String
    let realLifeName: String
    let tvSeries: TVSeries
    var currentLocation: FilmLocation
    let image: UIImage
    
    mutating func reportToSet(on location: FilmLocation) {
        guard canReportToSet(on: location) else { return }
        currentLocation = location
    }
    
    func canReportToSet(on location: FilmLocation) -> Bool {
        return location.tvSeries.description == tvSeries.description
    }
    
}

struct FilmLocation {
    let name: String
    let address: String
    var tvSeries: TVSeries
}

enum TVSeries {
    case familyMatters, fullHouse
    
    var description: String {
        switch self {
        case .familyMatters: return "Family Matters"
        case .fullHouse: return "Full House"
        }
    }
}

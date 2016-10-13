//
//  familyHouse.swift
//  FamilyHouse
//
//  Created by Tameika Lawrence on 10/10/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import UIKit

enum TVSeries {
    
    case familyMatters
    case fullHouse
    
    var description: String {
        switch self {
        case .familyMatters: return "Family Matters"
        case .fullHouse: return "Full House"
            
        }
    }
}

struct Filmlocation {
    
    let name: String
    let address: String
    var tvSeries: TVSeries
}


struct Character {
    let name: String
    let realLifeName: String
    let tvSeries: TVSeries
    var currentLocation: Filmlocation
    let image: UIImage
    
    func canReportToSet(on location: Filmlocation) -> Bool {
        if self.currentLocation.address == location.address {
            return true
        } else {
            
        return false
        }
        
    }
    
    
    mutating func reportToSet(on location: Filmlocation) {
        if canReportToSet(on: location) {
            self.currentLocation = location
            
        }
        
    }
    
}
















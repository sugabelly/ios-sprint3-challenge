//
//  Pokemon.swift
//  Pokedex
//
//  Created by Lotanna Igwe-Odunze on 11/2/18.
//  Copyright © 2018 Lotanna. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon: Equatable, Codable {
    
    var name: String
    var type: [PokemonType]
    var abilities: [Ability]
    let id: Int
    let image: Data
    
    
    //Structs for the API information
    
    struct Ability: Equatable, Codable {
        let name: String
    }
    
    struct PokemonType: Equatable, Codable {
        let name: String

    }
}

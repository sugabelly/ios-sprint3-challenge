//
//  Pokemon.swift
//  Pokedex
//
//  Created by Lotanna Igwe-Odunze on 11/2/18.
//  Copyright © 2018 Lotanna. All rights reserved.
//

import Foundation
import UIKit

struct Pokemon: Codable, Equatable {
    
    var name: String //From API
    let types: [TypeElement] //From API
    let abilities: [Ability] //From API
    var id: Int //From API
    let sprites: Sprites //From API
    var image: Data //Not from API
    
    enum CodingKeys: String, CodingKey {
        case name
        case types
        case abilities
        case id
        case sprites
    }
    
    //Structs for the API information
    
    struct Species: Codable {
        let name: String
    }
    
    struct TypeElement: Codable {
        let slot: Int
    }

    struct Ability: Codable {
        let ability: Species
        
        enum CodingKeys: String, CodingKey {
            case ability
        }
    }
    
    struct Sprites: Codable {
        let frontDefault: String
        
        enum CodingKeys: String, CodingKey {
            case frontDefault = "front_default"
        }
    }
    
    //Conforming to Equatable
    static func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    }
}

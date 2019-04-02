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
    let abilities: [AbilityElement]
    let id: Int
    let name: String
    let sprites: Sprites
    let types: [TypeElement]
    var image: Data?
}

struct AbilityElement: Codable, Equatable {
    let ability: TypeClass
    let isHidden: Bool
    let slot: Int
    
    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }
}

struct TypeClass: Codable, Equatable {
    let name: String
    let url: String
}

struct Sprites: Codable, Equatable {
    let backDefault, backFemale, backShiny, backShinyFemale: String
    let frontDefault, frontFemale, frontShiny, frontShinyFemale: String
    
    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }
}

struct TypeElement: Codable, Equatable {
    let slot: Int
    let type: TypeClass
}
    
    //Conforming to Equatable
func == (lhs: Pokemon, rhs: Pokemon) -> Bool {
        return lhs.id == rhs.id
    } 


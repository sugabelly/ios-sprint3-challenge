//
//  PokedexSearchView.swift
//  Pokedex
//
//  Created by Lotanna Igwe-Odunze on 11/2/18.
//  Copyright © 2018 Lotanna. All rights reserved.
//

import Foundation
import UIKit

class PokedexSearch: UIViewController, UISearchBarDelegate {
    
    //Outlets
    @IBOutlet weak var pokeSearchBar: UISearchBar!
    @IBOutlet weak var foundPokeName: UILabel!
    @IBOutlet weak var foundPokeID: UILabel!
    @IBOutlet weak var foundPokePhoto: UIImageView!
    @IBOutlet weak var foundPokeAbility: UILabel!
    @IBOutlet weak var foundPokeType: UILabel!
    
    //Properties
    var pokeMaster: PokemonManager?
    
    //Search Controls
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokeSearchBar.delegate = self
        loadPokemonResult()
    }
    
    //Perform the Search
    
    func didSearch(_ pokeSearchBar: UISearchBar ) {
        guard let pokeQuery = pokeSearchBar.text else { return } //Unwrap
        
        //Below is the JSON action that pulls the searched term from the API.
        PokemonImporter().getPokemon(searchedPokemon: pokeQuery, completion: { (error) in
            if let error = error {
                NSLog("Error fetching: \(error)") //Customise this for log.
                return
            }
            DispatchQueue.main.async { //Makes this happen in the background
                self.loadPokemonResult() //Calls your function that displays results on reload. Doesn't have to be called updateViews.
            }
        }) //End of Getting Pokemon
        
    }
    
    func loadPokemonResult() {
        if let pokemon = foundPokemon {
            foundPokeName.text = pokemon.name
            foundPokeID.text = "\(pokemon.id)"
            foundPokeAbility.text = pokemon.abilities.first?.name
            foundPokeType.text = pokemon.type.first?.name
        } else {
            foundPokeName.text = ""
            foundPokeID.text = ""
            foundPokeAbility.text = ""
            foundPokeType.text = ""
        }
    }
    
    @IBAction func savePokeButton(_ sender: UIButton) {
        
        
        
        
    }
    
    
}

//
//  PokemonListTableViewCell.swift
//  Kadama_v_1
//
//  Created by Labhesh Dudi on 03/03/22.
//

import UIKit

class PokemonListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonName: UILabel!
    @IBOutlet weak var pokemonAbilities: UILabel!
    @IBOutlet weak var pokemonId: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupPokemon(pokemon: Pokemon) {
        pokemonImage.image = UIImage(data: pokemon.image!)
        pokemonName.text = pokemon.name
        pokemonId.text = String(pokemon.id)
        pokemonAbilities.text = "Abilities: " + (pokemon.ability?.joined(separator: ", "))!
    }
    
}

//
//  PokemonDetails.swift
//  Kadama_v_1
//
//  Created by Kapil Dev on 13/06/21.
//

import Foundation

struct PokemonDetails: Codable {
    var abilities: [Ability]
    var name: String
    var id: Int
    var sprites: PokemonImages
}

struct Ability: Codable {
    var ability: AbilityName?
}

struct AbilityName: Codable {
    var name: String?
    var url: String?
}

struct PokemonImages: Codable {
    var back_default: String
    var back_shiny: String
    var front_default: String
    var front_shiny: String
}

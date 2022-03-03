//
//  PokemonList.swift
//  Kadama_v_1
//
//  Created by Kapil Dev on 13/06/21.
//

import Foundation

struct PokemonList: Codable {
    var count: Int
    var results: [PokemonBrief]
}

struct PokemonBrief: Codable {
    var name: String
    var url: String
}

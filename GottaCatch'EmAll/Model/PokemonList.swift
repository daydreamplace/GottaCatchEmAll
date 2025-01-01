//
//  PokemonList.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 12/31/24.
//

import Foundation

struct PokemonList: Decodable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonListItem]
}

struct PokemonListItem: Decodable {
    let name: String
    let url: String
    
    var id: Int {
        return Int(url.split(separator: "/").last ?? "0") ?? 0
    }
}

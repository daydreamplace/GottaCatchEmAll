//
//  PokemonDetail.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 1/1/25.
//

import Foundation

struct PokemonDetail: Decodable {
    let id: Int
    let name: String
    let weight: Double
    let height: Double
    let types: [String]
}

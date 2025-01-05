//
//  PokemonAPI.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 12/31/24.
//

import Foundation
import Moya

enum PokemonAPI {
    case fetchPokemonList(limit: Int, offset: Int)
    case fetchPokemonDetail(id: Int)
}

extension PokemonAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2")!
    }
    
    var path: String {
        switch self {
        case .fetchPokemonList:
            return "/pokemon"
        case .fetchPokemonDetail(let id):
            return "/pokemon/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchPokemonList, .fetchPokemonDetail:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .fetchPokemonList(let limit, let offset):
            return .requestParameters(parameters: ["limit": limit, "offset": offset], encoding: URLEncoding.default)
        case .fetchPokemonDetail:
            return .requestPlain
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}


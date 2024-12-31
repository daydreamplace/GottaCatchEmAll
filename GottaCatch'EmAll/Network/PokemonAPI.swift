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
}

extension PokemonAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://pokeapi.co/api/v2")!
    }
    
    var path: String {
        switch self {
        case .fetchPokemonList(let limit, let offset):
            return "/pokemon?limit=\(limit)&offset=\(offset)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}

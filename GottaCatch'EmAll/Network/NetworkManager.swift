//
//  NetworkManager.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 12/31/24.
//

import Foundation
import Moya

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let provider = MoyaProvider<PokemonAPI>()
}

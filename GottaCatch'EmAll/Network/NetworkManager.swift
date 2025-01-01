//
//  NetworkManager.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 12/31/24.
//

import Foundation
import Moya
import RxSwift

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let provider = MoyaProvider<PokemonAPI>()
    

    func fetch<T: Decodable>(endpoint: PokemonAPI, type: T.Type) -> Single<T> {
        return Single.create { [weak self] single in
            guard let self = self else {
                single(.failure(NSError(domain: "NetworkManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "Self is nil."])))
                return Disposables.create()
            }

            self.provider.request(endpoint) { result in
                switch result {
                case .success(let response):
                    do {
                        let decodedData = try JSONDecoder().decode(T.self, from: response.data)
                        single(.success(decodedData))
                    } catch {
                        single(.failure(error))
                    }
                case .failure(let error):
                    single(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
}

//
//  NetworkManager.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 12/31/24.
//

import Foundation
import UIKit
import Moya
import RxSwift

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    
    private let provider = MoyaProvider<PokemonAPI>()
    
    func fetch<T: Decodable>(endpoint: PokemonAPI, type: T.Type) -> Single<T> {
        return Single.create { [weak self] single in
            guard let self = self else {
                single(.failure(NSError(domain: "NetworkManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "cannot find network manager instance"])))
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
    
    func fetchImage(for id: Int) -> Single<UIImage> {
        return Single.create { single in
            let urlString = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(id).png"
            guard let url = URL(string: urlString) else {
                let error = NSError(domain: "NetworkManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "invalid url"])
                single(.failure(error))
                return Disposables.create()
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    single(.failure(error))
                    return
                }
                guard let data = data, let image = UIImage(data: data) else {
                    let error = NSError(domain: "NetworkManager", code: -1, userInfo: [NSLocalizedDescriptionKey: "failed to load image"])
                    single(.failure(error))
                    return
                }
                
                single(.success(image))
            }
            task.resume()
            
            return Disposables.create {
                task.cancel()
            }
        }
    }
}

//
//  MainViewModel.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 1/1/25.
//

import RxSwift
import RxCocoa

class MainViewModel {
    
    private let networkManager = NetworkManager.shared
    private let disposeBag = DisposeBag()
    
    var pokemonList: BehaviorSubject<[PokemonListItem]> = BehaviorSubject(value: [])
    
    var error: PublishSubject<String> = PublishSubject()
    
    private var limit: Int = 20
    private var offset: Int = 0
    
    func fetchPokemonList() {
        let endpoint = PokemonAPI.fetchPokemonList(limit: limit, offset: offset)
        
        networkManager.fetch(endpoint: endpoint, type: PokemonList.self)
            .subscribe{ [weak self] result in
                switch result {
                case .success(let pokemonListData):
                    self?.pokemonList.onNext(pokemonListData.results)
                case .failure(let error):
                    self?.error.onNext(error.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
    }
}

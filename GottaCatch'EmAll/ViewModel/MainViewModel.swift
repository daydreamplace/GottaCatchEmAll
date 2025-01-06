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
    
    var pokemonList: BehaviorRelay<[PokemonListItem]> = BehaviorRelay(value: [])
    var error: PublishSubject<String> = PublishSubject()
    
    private var limit: Int = 20
    private var offset: Int = 0
    private var isFetching: Bool = false
    private var totalPokemonCount: Int = Int.max
    
    func fetchPokemonList() {
        guard !isFetching, offset < totalPokemonCount else { return }
        isFetching = true
        
        let endpoint = PokemonAPI.fetchPokemonList(limit: limit, offset: offset)
        networkManager.fetch(endpoint: endpoint, type: PokemonList.self)
            .subscribe { [weak self] result in
                guard let self = self else { return }
                self.isFetching = false
                
                switch result {
                case .success(let pokemonListData):
                    self.totalPokemonCount = pokemonListData.count
                    self.offset += self.limit
                    
                    let currentList = self.pokemonList.value
                    let updatedList = currentList + pokemonListData.results
                    self.pokemonList.accept(updatedList)
                    
                case .failure(let error):
                    self.error.onNext(error.localizedDescription)
                }
            }
            .disposed(by: disposeBag)
    }

}


//
//  DetailViewModel.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 1/4/25.
//

import RxSwift
import RxCocoa

final class DetailViewModel {
    private let networkManager = NetworkManager.shared
    private let disposeBag = DisposeBag()
    
    let pokemonID = BehaviorSubject<Int?>(value: nil)
    
    let pokemonName = PublishSubject<String>()
    let pokemonType = PublishSubject<String>()
    let pokemonHeight = PublishSubject<String>()
    let pokemonWeight = PublishSubject<String>()
    let error = PublishSubject<String>()
    
    init() {
        bindPokemonID()
    }
    
    private func bindPokemonID() {
        pokemonID
            .compactMap { $0 }
            .flatMapLatest { [weak self] id -> Observable<PokemonDetail> in
                guard let self = self else { return Observable.empty() }
                return self.fetchPokemonDetail(id: id).asObservable()
            }
            .subscribe(onNext: { [weak self] detail in
                print("Fetched Pokemon Detail: \(detail)")
                self?.pokemonName.onNext(detail.name)
                self?.pokemonType.onNext(detail.types.joined(separator: ", "))
                self?.pokemonHeight.onNext("\(detail.height)m")
                self?.pokemonWeight.onNext("\(detail.weight)kg")
            }, onError: { [weak self] error in
                self?.error.onNext("포켓몬 데이터를 가져오는 데 실패했습니다: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }

    func fetchPokemonDetail(id: Int) -> Single<PokemonDetail> {
        return networkManager.fetch(endpoint: PokemonAPI.fetchPokemonDetail(id: id), type: PokemonDetail.self)
    }
}

//
//  DetailViewModel.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 1/4/25.
//

import UIKit
import RxSwift
import RxCocoa

final class DetailViewModel {
    
    private let networkManager = NetworkManager.shared
    private let disposeBag = DisposeBag()
    
    let pokemonName = PublishSubject<String>()
    let pokemonType = PublishSubject<String>()
    let pokemonHeight = PublishSubject<String>()
    let pokemonWeight = PublishSubject<String>()
    let pokemonImage = PublishSubject<UIImage?>()
    let error = PublishSubject<String>()
    
    init(pokemonID: Int) {
        fetchPokemonDetail(id: pokemonID)
        fetchPokemonImage(id: pokemonID)
    }
    
    private func fetchPokemonDetail(id: Int) {
        networkManager.fetch(endpoint: PokemonAPI.fetchPokemonDetail(id: id), type: PokemonDetail.self)
            .subscribe(onSuccess: { [weak self] detail in
                self?.pokemonName.onNext(detail.name)
                let types = detail.types.compactMap { $0.type.name }.joined(separator: ", ")
                self?.pokemonType.onNext(types)
                self?.pokemonHeight.onNext("\(detail.height)m")
                self?.pokemonWeight.onNext("\(detail.weight)kg")
            }, onFailure: { [weak self] error in
                self?.error.onNext("포켓몬 데이터를 가져오는 데 실패했습니다: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
    
    private func fetchPokemonImage(id: Int) {
        networkManager.fetchImage(for: id)
            .subscribe(onSuccess: { [weak self] image in
                self?.pokemonImage.onNext(image)
            }, onFailure: { [weak self] error in
                self?.error.onNext("이미지를 가져오는 데 실패했습니다: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}

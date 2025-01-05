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
    
    let pokemonID = BehaviorSubject<Int>(value: 0)
    let pokemonName = BehaviorSubject<String>(value: "")
    let pokemonType = BehaviorSubject<String>(value: "")
    let pokemonHeight = BehaviorSubject<String>(value: "")
    let pokemonWeight = BehaviorSubject<String>(value: "")
    let pokemonImage = BehaviorSubject<UIImage?>(value: nil)
    let error = BehaviorSubject<String>(value: "")
    
    init(pokemonID: Int) {
        self.pokemonID.onNext(pokemonID)
        fetchPokemonDetail(id: pokemonID)
        fetchPokemonImage(id: pokemonID)
    }
    
    private func fetchPokemonDetail(id: Int) {
        networkManager.fetch(endpoint: PokemonAPI.fetchPokemonDetail(id: id), type: PokemonDetail.self)
            .subscribe(onSuccess: { [weak self] detail in
                let translatedName = PokemonTranslator.getKoreanName(for: detail.name)
                let translatedTypes = detail.types.compactMap {
                    PokemonTypeName(rawValue: $0.type.name)?.displayName
                }.joined(separator: ", ")
                
                self?.pokemonName.onNext(translatedName)
                self?.pokemonType.onNext(translatedTypes)
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

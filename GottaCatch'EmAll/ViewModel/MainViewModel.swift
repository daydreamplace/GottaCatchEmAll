//
//  MainViewModel.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 1/1/25.
//

import Foundation
import RxSwift

class MainViewModel {
    private let networkManager = NetworkManager.shared
    private let disposeBag = DisposeBag()
    
    var pokemonList: BehaviorSubject<[PokemonListItem]> = BehaviorSubject(value: [])
    
    var error: PublishSubject<String> = PublishSubject()

    private var limit: Int = 20
    private var offset: Int = 0
}

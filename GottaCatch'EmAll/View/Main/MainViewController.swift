//
//  MainViewController.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 12/31/24.
//

import UIKit
import RxSwift

final class MainViewController: UIViewController {
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let endpoint = PokemonAPI.fetchPokemonList(limit: 10, offset: 0)
        
        NetworkManager.shared.fetch(endpoint: endpoint, type: Data.self)
            .subscribe { result in
                switch result {
                case .success(let data):
                    if let jsonString = String(data: data, encoding: .utf8) {
                        print("Test \(jsonString)")
                    }
                case .failure(let error):
                    print("Error \(error.localizedDescription)")
                }
            }
            .disposed(by: disposeBag)
    }
    
}


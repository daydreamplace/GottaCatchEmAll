//
//  PokemonCell.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 1/2/25.
//

import UIKit
import SnapKit
import RxSwift

final class PokemonCell: UICollectionViewCell {
    
    static let id = "PokemonCell"
    
    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(pokemonImageView)
        contentView.backgroundColor = .cellBackground
        contentView.layer.cornerRadius = 8
        
        pokemonImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    func configure(id: Int) {
        let networkManager = NetworkManager.shared
        networkManager.fetchImage(for: id)
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] image in
                self?.pokemonImageView.image = image
            }, onFailure: { error in
                print(" \(id): \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}

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
    
    private var disposeBag = DisposeBag()
    private var currentPokemonId: Int?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImageView.image = nil
        disposeBag = DisposeBag()
        currentPokemonId = nil
    }
    
    private func setupUI() {
        contentView.addSubview(pokemonImageView)
        contentView.backgroundColor = .cellBackground
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
        
        pokemonImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
    
    func configure(id: Int) {
        guard currentPokemonId != id else { return }
        currentPokemonId = id
        
        let networkManager = NetworkManager.shared
        networkManager.fetchImage(for: id)
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] image in
                guard self?.currentPokemonId == id else { return }
                self?.pokemonImageView.image = image
            }, onFailure: { error in
                print("Failed to load Pokemon \(id): \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}

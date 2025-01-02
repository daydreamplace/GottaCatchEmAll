//
//  MainViewController.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 12/31/24.
//

import UIKit
import SnapKit
import RxSwift

final class MainViewController: UIViewController {
    private let pokemonBallImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pokemonBall"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var pokemonCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: (view.frame.width - 40) / 3, height: (view.frame.width - 40) / 3)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "PokemonCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainRed
        setupViews()
    }
    
    func setupViews() {
        view.addSubviews(pokemonBallImageView, pokemonCollectionView)
        
        pokemonBallImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
        pokemonCollectionView.snp.makeConstraints { make in
            make.top.equalTo(pokemonBallImageView.snp.top).offset(120)
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
}

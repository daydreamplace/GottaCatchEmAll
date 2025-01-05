//
//  DetailViewController.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 12/31/24.
//

import UIKit
import SnapKit
import RxSwift

final class DetailViewController: UIViewController {
    
    private let viewModel = DetailViewModel()
    private let disposeBag = DisposeBag()
    
    private let pokemonView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkRed
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        return stackView
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainRed
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(pokemonView)
        
        pokemonView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(400)
        }
    }
}

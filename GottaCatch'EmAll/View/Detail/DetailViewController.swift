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
    
    private let pokemonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        return stackView
    }()
    
    private let pokemonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let idLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "54"
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "고라파덕"
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "타입: 물"
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "키: 0.8m"
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        label.text = "몸무게: 19.6kg"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        view.backgroundColor = .mainRed
        
        view.addSubview(pokemonView)
        pokemonView.addSubview(pokemonStackView)
        
        pokemonStackView.addArrangedSubviews(pokemonImageView, nameStackView, infoStackView)
        
        nameStackView.addArrangedSubviews(idLabel, nameLabel)
        infoStackView.addArrangedSubviews(typeLabel, heightLabel, weightLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        pokemonView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(400)
        }
        
        pokemonStackView.snp.makeConstraints{ make in
            make.edges.equalToSuperview().inset(16)
        }
    }
}

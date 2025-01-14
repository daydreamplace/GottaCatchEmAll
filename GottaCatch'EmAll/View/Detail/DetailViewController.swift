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
    
    private let viewModel: DetailViewModel
    private let disposeBag = DisposeBag()
    
    private let pokemonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .darkRed
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.layoutMargins = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
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
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let heightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private let weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    init(pokemonID: Int) {
        self.viewModel = DetailViewModel(pokemonID: pokemonID)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
    }
    
    private func configureUI() {
        view.backgroundColor = .mainRed
        view.addSubview(pokemonStackView)
        
        pokemonStackView.addArrangedSubviews(pokemonImageView, nameStackView, infoStackView)
        
        nameStackView.addArrangedSubviews(idLabel, nameLabel)
        infoStackView.addArrangedSubviews(typeLabel, heightLabel, weightLabel)
        
        pokemonStackView.snp.makeConstraints{ make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.trailing.equalToSuperview().inset(32)
            make.height.equalTo(400)
        }
    }
    
    private func bindViewModel() {
        viewModel.pokemonImage
            .observe(on: MainScheduler.instance)
            .bind(to: pokemonImageView.rx.image)
            .disposed(by: disposeBag)
        
        viewModel.pokemonID
            .map { "No.\($0)" }
            .observe(on: MainScheduler.instance)
            .bind(to: idLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.pokemonName
            .map { " \($0)" }
            .observe(on: MainScheduler.instance)
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.pokemonType
            .map { "타입: \($0)" }
            .observe(on: MainScheduler.instance)
            .bind(to: typeLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.pokemonHeight
            .map { "키: \($0)" }
            .observe(on: MainScheduler.instance)
            .bind(to: heightLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.pokemonWeight
            .map { "몸무게: \($0)" }
            .observe(on: MainScheduler.instance)
            .bind(to: weightLabel.rx.text)
            .disposed(by: disposeBag)
    }
}

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainRed
        setupViews()
    }
    
    func setupViews() {
        view.addSubviews(pokemonBallImageView)
        
        pokemonBallImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(100)
        }
        
    }
}

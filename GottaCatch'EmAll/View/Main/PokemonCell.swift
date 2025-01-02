//
//  PokemonCell.swift
//  GottaCatch'EmAll
//
//  Created by Eden on 1/2/25.
//

import UIKit
import SnapKit

final class PokemonCell: UICollectionViewCell {
    static let id = "PokemonCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .cellBackground
        contentView.layer.cornerRadius = 8
        contentView.clipsToBounds = true
    }
}

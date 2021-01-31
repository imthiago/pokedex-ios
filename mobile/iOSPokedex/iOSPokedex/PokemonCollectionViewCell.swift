//
//  PokemonCell.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 30/01/21.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    private lazy var labelText: UILabel = { return UILabel(frame: .zero )}()

    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokemonCollectionViewCell: ViewCodeConfiguration {
    func buildHierarchy() {
        contentView.addSubview(labelText)
    }

    func setupConstraints() {
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        labelText.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }

    func configureViews() {
        labelText.text = "teste"
    }
}

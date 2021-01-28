//
//  ViewCodeConfiguration.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 28/01/21.
//

protocol ViewCodeConfiguration {
    func buildHierarchy()

    func setupConstraints()

    func configureViews()
}

extension ViewCodeConfiguration {

    func configureViews() {}

    func applyViewCode() {
        buildHierarchy()
        setupConstraints()
        configureViews()
    }
}

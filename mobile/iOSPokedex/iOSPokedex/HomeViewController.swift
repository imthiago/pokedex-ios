//
//  HomeViewController.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 28/01/21.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    private lazy var titleLabel: UILabel = {
        UILabel(frame: .zero)
    }()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyViewCode()
    }
}

extension HomeViewController: ViewCodeConfiguration {
    func buildHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(collectionView)
    }

    func setupConstraints() {
        view.backgroundColor = .white

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor
            .constraint(equalTo: titleLabel.bottomAnchor, constant: 15)
            .isActive = true
        collectionView.leadingAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
            .isActive = true
        collectionView.trailingAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            .isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    func configureViews() {
        titleLabel.text = "Pokedex"
        titleLabel.font = UIFont(name: "Avenir Heavy", size: 32)

        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: collectionView.frame.width / 2.1, height: collectionView.frame.width / 3)
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
            as? PokemonCollectionViewCell {
            cell.backgroundColor = .red
            cell.layer.cornerRadius = 12
            return cell
        }

        return UICollectionViewCell()
    }
}

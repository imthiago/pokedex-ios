//
//  Coordinator.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 28/01/21.
//

import UIKit

protocol Coordinator: class {
    var navigationController: UINavigationController { get set }

    var childCoordinators: [Coordinator] { get set }

    init(_ navigationController: UINavigationController)

    func start()

    func childDidFinish(_ child: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
        }
    }
}

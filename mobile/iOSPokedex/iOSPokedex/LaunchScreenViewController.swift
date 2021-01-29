//
//  ViewController.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 21/12/20.
//

import UIKit

class LaunchScreenViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 428, height: 926))
        imageView.image = UIImage(named: "splash")
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animate()
        }
    }

    private func animate() {
        UIView.animate(withDuration: 1.5, animations: {
            self.imageView.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    let homeViewController = HomeViewController()
                    homeViewController.modalTransitionStyle = .crossDissolve
                    homeViewController.modalPresentationStyle = .fullScreen
                    self.present(homeViewController, animated: true)
                }
            }
        })
    }
}

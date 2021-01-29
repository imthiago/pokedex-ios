//
//  ViewController.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 21/12/20.
//

import UIKit
import Lottie

class LaunchScreenViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 478, height: 976))
        imageView.image = UIImage(named: "splash")
        return imageView
    }()

    private var animationView: AnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(imageView)
        setupLottieAnimation()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.async {
            self.animate()
        }
    }

    private func setupLottieAnimation() {
        animationView = .init(name: "22892-pikachu")
        animationView?.frame = CGRect(x: 0, y: 0, width: 299.6, height: 648.2)
        animationView?.center = view.center
        animationView?.contentMode = .scaleAspectFit
        animationView?.loopMode = .loop
        animationView?.animationSpeed = 1
        view.addSubview(animationView!)
        animationView?.play()
    }

    private func animate() {
        UIView.animate(withDuration: 1.5, delay: 1.5, animations: {
            self.imageView.alpha = 0
            self.animationView?.alpha = 0
        }, completion: { done in
            if done {
                DispatchQueue.main.async {
                    let navigationController = UINavigationController(rootViewController: HomeViewController())
                    navigationController.modalTransitionStyle = .crossDissolve
                    navigationController.modalPresentationStyle = .fullScreen
                    self.present(navigationController, animated: true)
                }
            }
        })
    }
}

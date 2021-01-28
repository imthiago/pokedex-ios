//
//  UIViewController+.swift
//  iOSPokedex
//
//  Created by Thiago Oliveira on 28/01/21.
//

import UIKit

extension UIViewController {
    func hideKeyboardOnTap() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        gesture.cancelsTouchesInView = false
        view.addGestureRecognizer(gesture)
    }

    @objc
    private func hideKeyboard() {
        view.endEditing(true)
    }
}

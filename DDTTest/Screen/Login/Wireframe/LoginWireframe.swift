//
//  LoginWireframe.swift
//  DDTTest
//
//  Created by Denny Arfansyah on 11/01/23.
//

import UIKit

struct LoginWireframe {
    static func screen() -> UIViewController {
        let viewController = LoginViewController()
        viewController.viewModel = LoginViewModel()
        return viewController
    }
}

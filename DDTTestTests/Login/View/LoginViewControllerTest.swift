//
//  LoginViewControllerTest.swift
//  DDTTestTests
//
//  Created by Denny Arfansyah on 11/01/23.
//

import UIKit
import XCTest
@testable import DDTTest

final class LoginViewControllerTest: XCTestCase {
    var vc: LoginViewController!

    override func setUp() {
        super.setUp()
        vc = LoginViewController()
        vc.viewModel = LoginViewModel()
        vc.loadViewIfNeeded()
    }
    
    func test_loginViewController_isExist() {
        XCTAssertNotNil(vc)
    }
    
    func test_nameGeneratorButtonPressed_shouldRandomName_whenNameisDoel() {
        vc.generateLogoutButton.tag = CommonInt.zero
        pressed(vc.generateLogoutButton)
        vc.viewModel.name = Names.doel.rawValue
        XCTAssertEqual(vc.greetingLabel.text, LoginConstant.greeting + CommonString.space + Names.doel.rawValue)
        XCTAssertEqual(vc.loginButton.isEnabled, true)
    }
    
    func test_nameGeneratorButtonPressed_shouldRandomName_whenNameisNotDoel() {
        vc.generateLogoutButton.tag = CommonInt.zero
        pressed(vc.generateLogoutButton)
        vc.viewModel.name = Names.zaenab.rawValue
        XCTAssertEqual(vc.greetingLabel.text, LoginConstant.greeting + CommonString.space + Names.zaenab.rawValue)
        XCTAssertEqual(vc.loginButton.isEnabled, false)
    }
    
    func test_loginButtonPressed_shouldChangeStatusImage() {
        vc.viewModel.isSuccessLogin = true
        pressed(vc.loginButton)
        XCTAssertEqual(vc.statusImageView.image, Assets.successLogin.localImage)
    }
    
    func test_logoutButtonPressed_shouldResetImage() {
        vc.generateLogoutButton.tag = CommonInt.one
        pressed(vc.generateLogoutButton)
        XCTAssertEqual(vc.statusImageView.image, Assets.login.localImage)
    }
    
    func pressed(_ button: UIButton) {
        button.sendActions(for: UIControl.Event.touchUpInside)
    }
    
    override func tearDown() {
        vc = nil
        super.tearDown()
    }
}

//
//  LoginViewController.swift
//  DDTTest
//
//  Created by Denny Arfansyah on 11/01/23.
//

import Combine
import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var generateLogoutButton: UIButton! {
        didSet {
            generateLogoutButton.tag = CommonInt.zero
        }
    }
    @IBOutlet weak var greetingLabel: UILabel! {
        didSet {
            greetingLabel.text = CommonString.emptyString
        }
    }
    @IBOutlet weak var statusImageView: UIImageView! {
        didSet {
            statusImageView.image = Assets.login.localImage
            statusImageView.contentMode = .scaleAspectFit
        }
    }
    @IBOutlet weak var overlayBottomView: UIView! {
        didSet {
            overlayBottomView.clipsToBounds = false
            overlayBottomView.layer.cornerRadius = CommonInt.twenty
            overlayBottomView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        }
    }
    @IBOutlet weak var loginNotes: UILabel! {
        didSet {
            loginNotes.text = LoginConstant.loginNotes
        }
    }
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.setTitle(LoginConstant.login, for: .normal)
            loginButton.backgroundColor = .systemBlue
            loginButton.setTitleColor(.black, for: .normal)
            loginButton.clipsToBounds = false
            loginButton.layer.cornerRadius = CommonInt.ten
        }
    }
    
    var viewModel: LoginViewModel!
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setObservable()
        viewModel.randomName()
    }
    
    private func setObservable() {
        subscriptions = [
            self.viewModel.$name.sink(receiveValue: { name in
                self.setContent(with: name)
            }),
            self.viewModel.$isSuccessLogin.sink(receiveValue: { isSuccessLogin in
                self.setSuccessLogin(isSuccessLogin)
            })
        ]
    }
    
    private func setContent(with name: String) {
        greetingLabel.text = LoginConstant.greeting + CommonString.space + name
        loginButton.isEnabled = name == Names.doel.rawValue ? true : false
    }
    
    private func setSuccessLogin(_ isSuccessLogin: Bool) {
        statusImageView.image = isSuccessLogin ? Assets.successLogin.localImage : Assets.login.localImage
        overlayBottomView.isHidden = isSuccessLogin
        generateLogoutButton.tag = isSuccessLogin ? CommonInt.one : CommonInt.zero
        generateLogoutButton.setTitle(isSuccessLogin ? GenerateLogoutButtonTitle.logout.rawValue :
                                        GenerateLogoutButtonTitle.generateName.rawValue, for: .normal)
    }
}

// MARK: - Action Handler(s)
extension LoginViewController {
    @IBAction func generatorLogoutButtonPressed(_ sender: UIButton) {
        if sender.tag == CommonInt.one {
            setSuccessLogin(false)
        }
        viewModel.randomName()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        viewModel.login()
    }
}

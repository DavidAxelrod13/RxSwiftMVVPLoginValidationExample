//
//  ViewController.swift
//  RxSwiftMVVPLoginValidationExample
//
//  Created by David on 27/02/2018.
//  Copyright © 2018 David. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.textAlignment = .center
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.layer.borderWidth = 0.3
        return tf
    }()

    let passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.textAlignment = .center
        tf.layer.cornerRadius = 5
        tf.clipsToBounds = true
        tf.layer.borderWidth = 0.3
        return tf
    }()
    
    
    lazy var loginButton: UIButton = {
        let but = UIButton(type: .system)
        but.setTitle("Login", for: .normal)
        but.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        but.clipsToBounds = true
        but.layer.cornerRadius = 10
        but.tintColor = .white
        but.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return but
    }()
    
    let infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Not Enabled"
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var loginStackView: UIStackView = {
        let sv = UIStackView()
        sv.spacing = 20
        sv.distribution = .fillEqually
        sv.axis = .vertical
        return sv
    }()
    
    let loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        bindUI()
        setupViews()
        
    }
    
    fileprivate func bindUI() {
        
        emailTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.emailText).disposed(by: disposeBag)
        passwordTextField.rx.text.map { $0 ?? "" }.bind(to: loginViewModel.passwordText).disposed(by: disposeBag)
        
        loginViewModel.isValid.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        
        loginViewModel.isValid.subscribe(onNext: { [unowned self] isValid in
            self.infoLabel.text = isValid ? "Enabled" : "Not Enabled"
            self.infoLabel.textColor = isValid ? UIColor.green : .red
            print("isValid = \(isValid)")
        }).disposed(by: disposeBag)
    }
    
    fileprivate func setupViews() {
        
        view.addSubview(loginStackView)
        
        [emailTextField, passwordTextField, loginButton, infoLabel].forEach {
            loginStackView.addArrangedSubview($0)
        }
        loginStackView.anchorDimensions(width: view.frame.width - 80, height: 0)
        loginStackView.anchorCenterSuperview()
        
        
    }
    
    
    @objc fileprivate func didTapLoginButton() {
        
    }

}


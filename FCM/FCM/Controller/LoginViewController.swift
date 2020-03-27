//
//  ViewController.swift
//  Firebase
//
//  Created by Ygor Nascimento on 18/03/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    private let homeViewController = HomeViewController()

    private let emailField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "E-mail"
        return textField
    }()

    private let passwordField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .default
        textField.placeholder = "Senha"
        return textField
    }()

    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailField, passwordField, signInButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.setCustomSpacing(24.0, after: passwordField)
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private let screenHeight = UIScreen.main.bounds.size.height * 0.300

    private func setupView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        signInButton.layer.cornerRadius = 5

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -screenHeight)
        ])
    }

    @objc func buttonAction() {
        //show(homeViewController, sender: signInButton)
        //present(homeViewController, animated: true, completion: nil)
        showDetailViewController(homeViewController, sender: signInButton)
    }


}


//
//  HomeViewController.swift
//  Firebase
//
//  Created by Ygor Nascimento on 19/03/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    private let balanceViewController = BalanceViewController()
    private let paymentViewController = PaymentViewController()


    private let goToPaymentViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Realizar Pagamento", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.addTarget(self, action: #selector(goToPaymentAction), for: .touchUpInside)
        return button
    }()

    private let goToBalanceViewButton: UIButton = {
        let button = UIButton()
        button.setTitle("Verificar Saldo", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.addTarget(self, action: #selector(goToBalanceAction), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [goToPaymentViewButton, goToBalanceViewButton])
        stack.axis = .vertical
        stack.spacing = 32
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

        goToPaymentViewButton.layer.cornerRadius = 5
        goToBalanceViewButton.layer.cornerRadius = 5

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }

    @objc func goToPaymentAction() {
        showDetailViewController(paymentViewController, sender: goToPaymentViewButton)
    }

    @objc func goToBalanceAction() {
        showDetailViewController(balanceViewController, sender: goToBalanceViewButton)
    }
}

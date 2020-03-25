//
//  BalanceViewController.swift
//  Firebase
//
//  Created by Ygor Nascimento on 19/03/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

class BalanceViewController: UIViewController {


    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Seu saldo:"
        label.textAlignment = .center
        label.font.withSize(16)
        return label
    }()

    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.text = "R$ 1.955,00"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, balanceLabel])
        stack.axis = .vertical
        stack.spacing = 16
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private let screenHeight = UIScreen.main.bounds.size.height * 0.500

    private func setupView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -screenHeight)
        ])
    }
}

//
//  PaymentViewController.swift
//  Firebase
//
//  Created by Ygor Nascimento on 19/03/20.
//  Copyright © 2020 Ygor Nascimento. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {



    private let titlePaymentLabel: UILabel = {
        let label = UILabel()
        label.text = "Valor do pagamento:"
        label.textAlignment = .center
        label.font.withSize(14)
        return label
    }()

    private let paymentField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        textField.placeholder = "R$ 0,00"
        return textField
    }()

    private let paymentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pagar", for: .normal)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        button.addTarget(self, action: #selector(paymentButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titlePaymentLabel, paymentField, paymentButton])
        stack.axis = .vertical
        stack.spacing = 16
        stack.setCustomSpacing(24.0, after: paymentField)
        return stack
    }()

    private let screenHeight = UIScreen.main.bounds.size.height * 0.500


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        paymentButton.layer.cornerRadius = 5

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -screenHeight)
        ])
    }


    @objc func paymentButtonAction() {
        print("Implantar Alert")
    }
}

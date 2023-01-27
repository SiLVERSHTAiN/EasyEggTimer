//
//  ButtonsView.swift
//  EggTimer
//
//  Created by Aleksandr on 27.01.2023.
//

import UIKit

enum Eggs {
    case soft
    case medium
    case hard
}

class ButtonsView: BaseView {

    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 10
        return stack
    }()
    
    private lazy var buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    private lazy var eggLabel: UILabel = {
        let label = UILabel()
        label.text = Resources.Title.eggLabel
        label.font = Resources.Fonts.helveticaRegular(with: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.makeSystem(button)
        button.setTitle("RESET", for: .normal)
        button.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 25)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    lazy var buttonsArray = [Button.init(image: Resources.Image.setupImage(.soft)!, wigth: UIScreen.main.bounds.width, tag: 300),
                             Button.init(image: Resources.Image.setupImage(.medium)!, wigth: UIScreen.main.bounds.width, tag: 420),
                             Button.init(image: Resources.Image.setupImage(.hard)!, wigth: UIScreen.main.bounds.width, tag: 600)]
    
    func viewDidLoad() {
        setupViews()
        constraintViews()
        configureAppearance()
    }
}

extension ButtonsView {
    
    override func setupViews() {
        super.setupViews()
        setupView(eggLabel)
        setupView(buttonStack)
        setupView(stackView)
        setupView(resetButton)

        buttonStack.addArrangedSubviews(buttonsArray)
        
        [
            eggLabel,
            buttonStack,
            resetButton
        ].forEach(stackView.addArrangedSubview)
        
    }
    
    override func constraintViews() {
    super.constraintViews()
        
        NSLayoutConstraint.activate([
            
            eggLabel.topAnchor.constraint(equalTo: topAnchor),
            eggLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            eggLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            eggLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),


            buttonStack.topAnchor.constraint(equalTo: eggLabel.bottomAnchor),
            buttonStack.centerXAnchor.constraint(equalTo: eggLabel.centerXAnchor),
            buttonStack.widthAnchor.constraint(equalToConstant: 300),
            buttonStack.heightAnchor.constraint(equalToConstant: 120),
            buttonStack.bottomAnchor.constraint(equalTo: resetButton.topAnchor, constant: -20),
            
            resetButton.centerXAnchor.constraint(equalTo: eggLabel.centerXAnchor),
            resetButton.heightAnchor.constraint(equalToConstant: 48),
            resetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
            resetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            resetButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }
}

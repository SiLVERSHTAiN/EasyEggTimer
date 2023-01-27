//
//  TimerVC.swift
//  EggTimer
//
//  Created by Aleksandr on 27.01.2023.
//

import UIKit

class TimerVC: UIViewController {
    
    private let timerView = TimerView()
    private let buttonsView = ButtonsView()
    
    private let timerDuration = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        constraintViews()
        configureAppearance()
        setupActions()
    }
}

extension TimerVC {
    
    func setupViews() {
        view.setupView(timerView)
        view.setupView(buttonsView)
    }
    
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            buttonsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 15),
            buttonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
    }
    
    func configureAppearance() {
        timerView.configure(with: timerDuration, progress: 0)
        view.backgroundColor = Resources.Colors.background
    }
    
    func setupActions() {
        for button in buttonsView.buttonsArray {
            button.addAction(UIAction { _ in self.buttonTapped(button)}, for: .touchUpInside)
        }
        buttonsView.resetButton.addAction(UIAction { [self] _ in self.resetButtonTapped(buttonsView.resetButton)}, for: .touchUpInside)
    }
    
    func buttonTapped(_ sender: UIButton) {
        guard let button = sender as? Button else { return }
        timerView.timerDuration = Double(button.tag)
        timerView.startTimer()
    }
    
    func resetButtonTapped(_ sender: UIButton) {
        timerView.stopTimer()
    }
}

//
//  UIStackView + ext.swift
//  EggTimer
//
//  Created by Aleksandr on 27.01.2023.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
}

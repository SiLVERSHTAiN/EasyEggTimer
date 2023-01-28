//
//  Button.swift
//  EggTimer
//
//  Created by Aleksandr on 27.01.2023.
//

import UIKit

class Button: UIButton {
    
    //TODO: Добавить при активации кнопки, чтобы она подсвечивалась синим
    
    let buttonLayer = CAShapeLayer()
    
    init(image: UIImage, wigth: CGFloat, tag: Int) {
        super.init(frame: .zero)
        setImage(image, for: .normal)
        self.tag = tag

        let aPath = UIBezierPath(ovalIn: CGRectMake(0, 0, wigth/3.8, 120))

        buttonLayer.fillColor = UIColor.clear.cgColor
        buttonLayer.strokeColor = UIColor.systemGray.cgColor
        buttonLayer.lineWidth = 3
        buttonLayer.path = aPath.cgPath
        
        self.layer.addSublayer(buttonLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIButton {
    
    func makeSystem(_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchUpInside,
            .touchDragOutside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
}

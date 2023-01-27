//
//  Resources.swift
//  EggTimer
//
//  Created by Aleksandr on 27.01.2023.
//

import UIKit

enum Resources {
    
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inActive = UIColor(hexString: "#929DA5")
        
        static let titleGray = UIColor(hexString: "#545C77")
        static let background = UIColor(hexString: "#F8F9F9")
        
        static let separator = UIColor(hexString: "#E8ECEF")
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
    
    enum Title {
        static let elapsedTime = "Elapsed Times"
        static let remainigTime = "Remaining Time"
        
        static let completed = "COMPLETED"
        static let remaining = "REMAINING"
        
        static let eggLabel = "How would you like your eggs?"
    }
    
    enum Image {
        
        case soft
        case medium
        case hard
        
        static func setupImage(_ imageName: Image) -> UIImage? {
            switch imageName {
            case .soft: return UIImage(named: "soft")
            case .medium: return UIImage(named: "medium")
            case .hard: return UIImage(named: "hard")
            }
        }
    }
}

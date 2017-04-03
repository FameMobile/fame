//
//  Colors.swift
//  fame
//
//  Created by Jeff Cohen on 3/20/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

public enum Color {
    case black
    case clear
    case golden
    case gray
    case grayDark
    case purple
    case white
    
    public var uiColor: UIColor {
        switch self {
        case .black: return UIColor.black
        case .clear: return UIColor.clear
        case .golden: return UIColor(red: 0.87, green: 0.67, blue: 0.32, alpha: 1)
        case .gray: return UIColor(red: 0.73, green: 0.73, blue: 0.73, alpha: 1)
        case .grayDark: return UIColor(red: 0.27, green: 0.24, blue: 0.27, alpha: 1)
        case .purple: return UIColor(red: 0.19, green: 0.09, blue: 0.19, alpha: 1)
        case .white: return UIColor.white
        }
    }
    
    public var cgColor: CGColor {
        return self.uiColor.cgColor
    }
}

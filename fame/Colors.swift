//
//  Colors.swift
//  fame
//
//  Created by Jeff Cohen on 3/20/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

public enum Color {
    case darkestPurple
    case lightestPurple
    case golden
    
    public var uiColor: UIColor {
        switch self {
        case .darkestPurple: return UIColor(red: 0.15, green: 0.12, blue: 0.14, alpha: 1)
        case .lightestPurple: return UIColor(red: 0.19, green: 0.10, blue: 0.19, alpha: 1)
        case .golden: return UIColor(red: 0.87, green: 0.67, blue: 0.32, alpha: 1)
        }
    }
    
    public var cgColor: CGColor {
        return self.uiColor.cgColor
    }
}

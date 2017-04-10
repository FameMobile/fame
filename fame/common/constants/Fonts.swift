//
//  Fonts.swift
//  fame
//
//  Created by Jeff Cohen on 4/9/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

enum BasicSans: String {
    case bold = "Bold"
    case extraLight = "ExtraLight"
    case light = "Light"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case thin = "Thin"
    case thinIt = "ThinIt"
    
    var name: String {
        return "BasicSans-\(self.rawValue)"
    }
    
    func font(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: self.name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}

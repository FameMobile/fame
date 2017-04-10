//
//  LabelProtocol.swift
//  fame
//
//  Created by Jeff Cohen on 3/31/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol DefaultLabel {
    init(title: String, font: UIFont, color: UIColor)
}

extension DefaultLabel where Self: UILabel {
    private static var defaultFont: UIFont {
        return BasicSans.regular.font(ofSize: 15.0)
    }
    
    init(title: String, font: UIFont = Self.defaultFont, color: UIColor = Color.golden.uiColor) {
        self.init(frame: .zero)
        self.textColor = color
        self.text = title
        self.font = font
        self.layoutIfNeeded()
        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = true
    }
}

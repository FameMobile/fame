//
//  LabelProtocol.swift
//  fame
//
//  Created by Jeff Cohen on 3/31/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol DefaultLabel {
    init(title: String, color: UIColor)
}

extension DefaultLabel where Self: UILabel {
    init(title: String, color: UIColor = Color.golden.uiColor) {
        self.init(frame: .zero)
        self.textColor = color
        self.text = title
        self.font = UIFont.systemFont(ofSize: 17.0)
        self.layoutIfNeeded()
        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = true
    }
}

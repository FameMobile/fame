//
//  BaseTitleLabel.swift
//  fame
//
//  Created by Jeff Cohen on 3/24/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class BaseTitleLabel: UILabel {
    
    init(title: String, color: UIColor = Color.golden.uiColor) {
        super.init(frame: .zero)
        self.textColor = color
        self.text = title
        self.font = UIFont.systemFont(ofSize: 17.0)
        self.layoutIfNeeded()
        self.sizeToFit()
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  ViewProtocols.swift
//  fame
//
//  Created by Jeff Cohen on 4/1/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol Hideable {
    func show()
    func hide()
}

extension Hideable where Self: UINavigationBar {
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}

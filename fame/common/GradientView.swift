//
//  GradientView.swift
//  fame
//
//  Created by Jeff Cohen on 3/20/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    func gradient(colors: [CGColor], locations: [NSNumber]) {
        self.gradientLayer.locations = locations
        self.gradientLayer.colors = colors
        self.gradientLayer.layoutIfNeeded()
    }
    
    func fameGradient() {
        self.gradient(colors: [Color.darkestPurple.cgColor, Color.lightestPurple.cgColor], locations: [0.0, 1.0])
    }
}

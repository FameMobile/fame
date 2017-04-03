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

protocol Colorful {
    static func withColor(_ color: UIColor) -> UIImage
}

extension Colorful where Self: UIImage {
    static func withColor(_ color: UIColor) -> UIImage {
        let pixelScale = UIScreen.main.scale
        let pixelSize = 1 / pixelScale
        let fillSize = CGSize(width: pixelSize, height: pixelSize)
        let fillRect = CGRect(origin: CGPoint.zero, size: fillSize)
        UIGraphicsBeginImageContextWithOptions(fillRect.size, false, pixelScale)
        if let graphicsContext = UIGraphicsGetCurrentContext() {
            graphicsContext.setFillColor(color.cgColor)
            graphicsContext.fill(fillRect)
            graphicsContext.setAlpha(1)
        }
        if let image = UIGraphicsGetImageFromCurrentImageContext() {
            UIGraphicsEndImageContext()            
            return image
        }
        return UIImage()        
    }
}

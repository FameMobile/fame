//
//  ViewProtocols.swift
//  fame
//
//  Created by Jeff Cohen on 4/1/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit
import PureLayout

// MARK - Hideable
protocol Hideable {
    func show()
    func hide()
}

extension Hideable where Self: UIView {
    func show() {
        self.isHidden = false
    }
    
    func hide() {
        self.isHidden = true
    }
}

// MARK - Colorful
protocol Colorful {
    static func border(color: Color, thickness: CGFloat) -> UIView
    static func color(_ color: Color, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIView
    var uiImage: UIImage? { get }
}

extension Colorful where Self: UIView {
    static var defaultBorderColor: Color { return Color.grayDark }
    static var defaultBorderThickness: CGFloat { return StandardBorderThickness }
    
    static func border(color: Color = Self.defaultBorderColor, thickness: CGFloat = Self.defaultBorderThickness) -> UIView {
        return self.color(color, x: 0, y: 0, width: thickness, height: thickness)
    }
    
    static func color(_ color: Color, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIView {
        let fillRect = CGRect(x: x, y: y, width: width, height: height)
        let view = self.newAutoLayout()
        view.frame = fillRect
        view.backgroundColor = color.uiColor
        view.alpha = 1
        return view
    }
    
    var uiImage: UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, self.isOpaque, UIScreen.main.scale)
        if let currentContext = UIGraphicsGetCurrentContext() {
            currentContext.setAlpha(self.alpha)
            self.layer.render(in: currentContext)
            
            if let bgColor = self.backgroundColor?.cgColor {
                currentContext.setFillColor(bgColor)
            }
            
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            if let cgImage = image?.cgImage {
                return UIImage(cgImage: cgImage)
            }
        }
        return nil
    }
}

// MARK - Circular
protocol Circular {
    //static func circle(image: UIImage?, backgroundColor: Color) -> Self
    func makeCircular()
}

extension Circular where Self: UIView {
    func makeCircular() {
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.clipsToBounds = true
    }    
}

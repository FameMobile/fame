//
//  RoundProtocol.swift
//  fame
//
//  Created by Jeff Cohen on 4/22/17.
//  Copyright © 2017 Fame. All rights reserved.
//
//  Converted to Swift from original Obj-c by Trevor Harmon. Used with permission.
//  http://vocaro.com/trevor/blog/wp-content/uploads/2009/10/UIImage+Resize.m
//
//  Trevor used code with permission from
//  http://blog.sallarp.com/iphone-uiimage-round-corners/

import UIKit

protocol Round {
    func rounded(cornerRadius radius: UInt, borderSize: UInt) -> UIImage
}

extension Round where Self: UIImage {
    // Adds a rectangular path to the given context and rounds its corners by the given extents
    private func add(roundedRect rect: CGRect, context: CGContext, ovalWidth: CGFloat, ovalHeight: CGFloat) {
        
        guard ovalWidth != 0 && ovalHeight != 0 else {
            context.addRect(rect)
            return
        }
        
        context.saveGState()
        context.translateBy(x: rect.minX, y: rect.minY)
        context.scaleBy(x: ovalWidth, y: ovalHeight)
        let fw: CGFloat = rect.width / ovalWidth
        let fh: CGFloat = rect.height / ovalHeight
        context.move(to: CGPoint(x: fw, y: fh/2))
        context.addArc(tangent1End: CGPoint(x: fw, y: fh), tangent2End: CGPoint(x: fw/2, y: fh), radius: 1)
        context.addArc(tangent1End: CGPoint(x: 0, y: fh), tangent2End: CGPoint(x: 0, y: fh/2), radius: 1)
        context.addArc(tangent1End: CGPoint(x: 0, y: 0), tangent2End: CGPoint(x: fw/2, y: 0), radius: 1)
        context.addArc(tangent1End: CGPoint(x: fw, y: 0), tangent2End: CGPoint(x: fw, y: fh/2), radius: 1)
        context.closePath()
        context.restoreGState()
    }
    
    // Creates a copy of this image with rounded corners
    // If borderSize is non-zero, a transparent border of the given size will also be added
    func rounded(cornerRadius radius: UInt, borderSize: UInt) -> UIImage {
        // If the image does not have an alpha layer, add one
        // Build a context that's the same dimensions as the new size
        guard let image = self.imageWithAlpha().cgImage, let context = CGContext(image: image) else {
            return self
        }
        
        // Create a clipping path with rounded corners
        context.beginPath()
        let border = Int(borderSize)
        self.add(roundedRect: CGRect(x: border,
                                     y: border,
                                     width: image.width - border * 2,
                                     height: image.height - border * 2),
                 context: context,
                 ovalWidth: CGFloat(radius),
                 ovalHeight: CGFloat(radius))
        context.closePath()
        context.clip()
        
        // Draw the image to the context; the clipping path will make anything outside the rounded rect transparent
        context.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))
        
        // Create a CGImage from the context
        guard let clippedImage = context.makeImage() else {
            return self
        }
        return UIImage(cgImage: clippedImage)
    }
    
    // Adds a rectangular path to the given context and rounds its corners by the given extents
    // Original author: BjÃ¶rn SÃ¥llarp. Used with permission. See: http://blog.sallarp.com/iphone-uiimage-round-corners/
}

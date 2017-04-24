//
//  AlphaProtocol.swift
//  fame
//
//  Created by Jeff Cohen on 4/23/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol Alpha {
    func hasAlpha() -> Bool
    func imageWithAlpha() -> UIImage
    func transparentBorderImage(borderSize: UInt) -> UIImage
}

extension Alpha where Self: UIImage {
    // Creates a mask that makes the outer edges transparent and everything else opaque
    // The size must include the entire mask (opaque part + transparent border)    
    private func newBorderMask(borderSize: UInt, size: CGSize) -> CGImage? {
        // Build a context that's the same dimensions as the new size
        let bitmap = CGContext.init(data: nil,
                                    width: Int(size.width),
                                    height: Int(size.height),
                                    bitsPerComponent: 8,
                                    bytesPerRow: 0,
                                    space: CGColorSpaceCreateDeviceGray(),
                                    bitmapInfo: CGBitmapInfo().rawValue | CGImageAlphaInfo.none.rawValue)
        guard let context = bitmap else {
            return self.cgImage
        }
        
        let border = CGFloat(borderSize)
        // Start with a mask that's entirely transparent
        context.setFillColor(Color.black.cgColor)
        context.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        // Make the inner part (within the border) opaque
        context.setFillColor(Color.white.cgColor)
        context.fill(CGRect(x: border, y: border, width: size.width - border * 2, height: size.height - border * 2))
        
        // Get an image of the context
        return context.makeImage()
    }
    
    // Returns true if the image has an alpha layer
    func hasAlpha() -> Bool {
        guard let alpha = self.cgImage?.alphaInfo else {
            return false
        }
        
        return ![.first, .last, .premultipliedFirst, .premultipliedLast].flatMap { $0 == alpha }.isEmpty
    }
    
    func imageWithAlpha() -> UIImage {
        guard !self.hasAlpha(), let image = self.cgImage else {
            return self
        }
        
        // The bitsPerComponent and bitmapInfo values are hard-coded to prevent an "unsupported parameter combination" error        
        guard let context = CGContext(image: image, bitsPerComponent: 8, bitmapInfo: 0 | CGImageAlphaInfo.premultipliedFirst.rawValue) else {
            return self
        }
        
        // Draw the image into the context and retrieve the new image, which will now have an alpha layer
        context.draw(image, in: CGRect(x: 0, y: 0, width: image.width, height: image.height))
        guard let alphaImage = context.makeImage() else {
            return self
        }
        
        return UIImage(cgImage: alphaImage)
    }
    
    // Returns a copy of the image with a transparent border of the given size added around its edges.
    // If the image has no alpha layer, one will be added to it.
    func transparentBorderImage(borderSize: UInt) -> UIImage {
        // If the image does not have an alpha layer, add one
        guard let image = self.imageWithAlpha().cgImage else {
            return self
        }
        
        let border = Int(borderSize)
        
        let newRect = CGRect(x: 0, y: 0, width: image.width + border * 2, height: image.height + border * 2)
        
        // Build a context that's the same dimensions as the new size
        guard let context = CGContext(image: image, bounds: newRect.size) else {
            return self
        }
        
        // Draw the image in the center of the context, leaving a gap around the edges
        let location = CGRect(x: border, y: border, width: image.width, height: image.height)
        context.draw(image, in: location)
        let borderImage = context.makeImage()
        
        // Create a mask to make the border transparent, and combine it with the image
        let maskImage = self.newBorderMask(borderSize: borderSize, size: newRect.size)
        
        guard let mask = maskImage, let transparentBorderImage = borderImage?.masking(mask) else {
            return self
        }
        
        return UIImage(cgImage: transparentBorderImage)
    }
}

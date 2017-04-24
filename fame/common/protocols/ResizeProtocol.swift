//
//  ImageProtocols.swift
//  fame
//
//  Created by Jeff Cohen on 4/21/17.
//  Copyright © 2017 Fame. All rights reserved.
//
//  Converted to Swift from original Obj-c by Trevor Harmon. Used with permission.
//  http://vocaro.com/trevor/blog/wp-content/uploads/2009/10/UIImage+Resize.m

import UIKit

protocol Resize {
     func cropped(bounds: CGRect) -> UIImage
     func thumbnail(size: Int, transparentBorder borderSize: UInt, cornerRadius: UInt, interpolationQuality quality: CGInterpolationQuality) -> UIImage
     func resized(bounds: CGSize, interpolationQuality quality: CGInterpolationQuality) -> UIImage
     func resized(contentMode: UIViewContentMode, bounds: CGSize, interpolationQuality quality: CGInterpolationQuality) -> UIImage
}

extension Resize where Self: UIImage {
     // Returns a copy of the image that has been transformed using the given affine transform and scaled to the new size
     // The new image's orientation will be UIImageOrientationUp, regardless of the current image's orientation
     // If the new size is not integral, it will be rounded up
     private func resized(bounds: CGSize, transform: CGAffineTransform, drawTransposed transpose: Bool, interpolationQuality quality: CGInterpolationQuality) -> UIImage {
          
          guard let image = self.cgImage else {
               return self
          }
          
          let newRect = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height).integral
          let transposedRect = CGRect(x: 0, y: 0, width: newRect.size.height, height: newRect.size.width)
          
          // Build a context that's the same dimensions as the new size
          guard let context = CGContext(image: image, bounds: newRect.size) else {
               return self
          }
          
          // Rotate and/or flip the image if required by its orientation
          context.concatenate(transform)
          
          // Set the quality level to use when rescaling
          context.interpolationQuality = quality
          
          // Draw into the context; this scales the image
          context.draw(image, in: transpose ? transposedRect : newRect)
          
          // Get the resized image from the context and a UIImage
          guard let newImage = context.makeImage() else {
               return self
          }
          
          return Self(cgImage: newImage)
     }
     
     // Returns an affine transform that takes into account the image orientation when drawing a scaled image
     private func transform(bounds: CGSize) -> CGAffineTransform {
          var transform: CGAffineTransform = .identity
          
          switch self.imageOrientation {
          case .down, .downMirrored:           // EXIF = 3 or 4
               transform = transform.translatedBy(x: bounds.width, y: bounds.height)
               transform = transform.rotated(by: .pi)
          case .left, .leftMirrored:           // EXIF = 5 or 6
               transform = transform.translatedBy(x: bounds.width, y: 0)
               transform = transform.rotated(by: .pi / 2)
          case .right, .rightMirrored:          // EXIF = 7 or 8
               transform = transform.translatedBy(x: 0, y: bounds.height)
               transform = transform.rotated(by: -.pi / 2)
          default:
               break
          }
          
          switch self.imageOrientation {
          case .upMirrored, .downMirrored:     // EXIF = 2 or 4
               transform = transform.translatedBy(x: bounds.width, y: 0)
               transform = transform.scaledBy(x: -1, y: 1)
          case .leftMirrored, .rightMirrored:   // EXIF = 5 or 7
               transform = transform.translatedBy(x: bounds.height, y: 0)
               transform = transform.scaledBy(x: -1, y: 1)
          default:
               break
          }
          
          return transform
     }
     
     // Returns a copy of this image that is cropped to the given bounds.
     // The bounds will be adjusted using CGRectIntegral.
     // This method ignores the image's imageOrientation setting.
     func cropped(bounds: CGRect) -> UIImage {
          guard let image = self.cgImage?.cropping(to: bounds) else {
               return self
          }
          return UIImage(cgImage: image)
     }
     
     /*
      Returns a copy of this image that is squared to the thumbnail size.
      If transparentBorder is non-zero, a transparent border of the given size will
      be added around the edges of the thumbnail. (Adding a transparent border of at
      least one pixel in size has the side-effect of antialiasing the edges of the
      image when rotating it using Core Animation.)
      */
     func thumbnail(size: Int, transparentBorder borderSize: UInt, cornerRadius: UInt, interpolationQuality quality: CGInterpolationQuality) -> UIImage {
          
          let floatSize = CGFloat(size)
          let resizedImage = self.resized(contentMode: .scaleAspectFill, bounds: CGSize(width: size, height: size), interpolationQuality: quality)
          
          // Crop out any part of the image that's larger than the thumbnail size
          // The cropped rect must be centered on the resized image
          // Round the origin points so that the size isn't altered when CGRectIntegral is later invoked
          let cropRect: CGRect = CGRect(x: round((resizedImage.size.width - floatSize) / CGFloat(2)),
                                        y: round((resizedImage.size.height - floatSize) / CGFloat(2)),
                                        width: floatSize, height: floatSize)
          let croppedImage: UIImage = resizedImage.cropped(bounds: cropRect)
          let transparentBorderImage: UIImage
          if borderSize > 0 {
               transparentBorderImage = croppedImage.transparentBorderImage(borderSize: borderSize)
          } else {
               transparentBorderImage = croppedImage
          }
          
          return transparentBorderImage.rounded(cornerRadius: cornerRadius, borderSize: borderSize)
     }
     
     // Returns a rescaled copy of the image, taking into account its orientation
     // The image will be scaled disproportionately if necessary to fit the bounds specified by the parameter
     func resized(bounds: CGSize, interpolationQuality quality: CGInterpolationQuality) -> UIImage {
          
          let drawTransposed: Bool
          switch self.imageOrientation {
          case .left, .leftMirrored, .right, .rightMirrored:
               drawTransposed = true
          default:
               drawTransposed = false
          }
          
          return self.resized(bounds: bounds,
                              transform: self.transform(bounds: bounds),
                              drawTransposed: drawTransposed,
                              interpolationQuality: quality)
     }
     
     // Resizes the image according to the given content mode, taking into account the image's orientation
     func resized(contentMode: UIViewContentMode, bounds: CGSize, interpolationQuality quality: CGInterpolationQuality) -> UIImage {
          let horizontalRatio: CGFloat = bounds.width / self.size.width
          let verticalRatio: CGFloat = bounds.height / self.size.height
          
          let ratio: CGFloat
          switch contentMode {
          case .scaleAspectFill:
               ratio = max(horizontalRatio, verticalRatio)
          case .scaleAspectFit:
               ratio = min(horizontalRatio, verticalRatio)
          default:
               fatalError("Unsupported content mode \(contentMode)")
          }
          
          let newSize = CGSize(width: self.size.width * ratio, height: self.size.height * ratio);
          
          return self.resized(bounds: newSize, interpolationQuality: quality)
     }
}

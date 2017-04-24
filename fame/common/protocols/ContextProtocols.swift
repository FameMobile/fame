//
//  ContextProtocols.swift
//  fame
//
//  Created by Jeff Cohen on 4/23/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol ContextPlus {
    init?(image: CGImage, data: UnsafeMutableRawPointer?, bounds: CGSize?, bitsPerComponent: Int?, bytesPerRow: Int, bitmapInfo: UInt32?)
}

extension ContextPlus where Self: CGContext {
    init?(image: CGImage, data: UnsafeMutableRawPointer? = nil, bounds: CGSize? = nil, bitsPerComponent: Int? = nil, bytesPerRow: Int = 0, bitmapInfo: UInt32? = nil) {
        let size = bounds ?? CGSize(width: image.width, height: image.height)
        self.init(data: data,
                  width: Int(size.width),
                  height: Int(size.height),
                  bitsPerComponent: bitsPerComponent ?? image.bitsPerComponent,
                  bytesPerRow: bytesPerRow,
                  space: image.colorSpace ?? CGColorSpaceCreateDeviceRGB(),
                  bitmapInfo: Self.normalizeBitmapInfo(bitmapInfo ?? image.bitmapInfo.rawValue))
    }
    
    fileprivate static func normalizeBitmapInfo(_ bI: UInt32) -> UInt32 {
        var alphaInfo: UInt32 = bI & CGBitmapInfo.alphaInfoMask.rawValue
        
        if alphaInfo == CGImageAlphaInfo.last.rawValue {
            alphaInfo =  CGImageAlphaInfo.premultipliedLast.rawValue
        }
        
        if alphaInfo == CGImageAlphaInfo.first.rawValue {
            alphaInfo = CGImageAlphaInfo.premultipliedFirst.rawValue
        }
        
        var newBI: UInt32 = bI & ~CGBitmapInfo.alphaInfoMask.rawValue
        
        newBI |= alphaInfo;
        
        return newBI
    }
}

//
//  Constants.swift
//  fame
//
//  Created by Jeff Cohen on 3/21/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

// MARK - Closure Aliases
typealias CompleteWithValue = (_ value: Any?) -> Void


// MARK - UI Values
var StandardBorderThickness: CGFloat {
    get {
        let standardWidth = CGFloat(1)
        let pixelScale = UIScreen.main.scale
        return standardWidth / pixelScale
    }
}

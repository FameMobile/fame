//
//  NibLoadingView.swift
//  fame
//
//  Created by Jeff Cohen on 4/8/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

@IBDesignable
public class NibDesignableView: UIView {
    
    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupNib()
    }
    
    // MARK: - NSCoding
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupNib()
    }
    
    // MARK: - Nib loading
    
    /**
     Called in init(frame:) and init(aDecoder:) to load the nib and add it as a subview.
     */
    private func setupNib() {
        let view = Bundle.loadView(fromNib: self.nibName(), withType: type(of: self))
        // use bounds not frame or it'll be offset
        view.frame = self.bounds
        
        // Make the view stretch with containing view
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
    }
    
    /**
     Called in the default implementation of loadNib(). Default is class name.
     
     :returns: Name of a single view nib file.
     */
    public func nibName() -> String {
        return type(of: self).description().components(separatedBy: ".").last!
    }
}

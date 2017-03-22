//
//  SYJBaseViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/22/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class SYJBaseViewController: UIViewController {
    let complete: (_ value: Any?) -> Void
    
    init(complete: @escaping (_ value: Any?) -> Void) {
        self.complete = complete
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = self.titleView()
    }
    
    fileprivate func titleView() -> UIView {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.textColor = Color.golden.uiColor
        titleLabel.text = "START YOUR JOURNEY"
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        titleLabel.layoutIfNeeded()
        titleLabel.sizeToFit()
        titleLabel.translatesAutoresizingMaskIntoConstraints = true
        
        return titleLabel
    }
}

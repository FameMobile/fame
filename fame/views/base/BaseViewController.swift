//
//  BaseViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var navigationTitle: String?
    
    init(navigationTitle: String? = nil, viewTitle: String? = nil) {
        super.init(nibName: nil, bundle: nil)
        self.navigationTitle = navigationTitle
        self.title = viewTitle
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 0.19, green: 0.09, blue: 0.19, alpha: 1)
        if let navTitle = self.navigationTitle {
            self.navigationItem.titleView = BaseTitleLabel(title: navTitle)
        }
    }

    func add(childViewController: UIViewController) {
        self.addChildViewController(childViewController)
        childViewController.view.frame = self.view.frame
        self.view.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
    }
}

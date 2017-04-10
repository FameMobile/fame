//
//  BaseViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var complete: CompleteWithValue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Color.purple.uiColor
        
        if let child = self.childViewController() {
            self.add(childViewController: child)
        }
        
        if let rightButton = self.rightBarButtonItem() {
            self.navigationItem.rightBarButtonItem = rightButton
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavTitle(self.navigationTitle())
    }
}

extension BaseViewController: NavigationControllerChild {
    func navigationTitle() -> String? { return nil }
    func childViewController() -> BaseViewController? { return nil }
    func rightBarButtonItem() -> UIBarButtonItem? { return nil}
}

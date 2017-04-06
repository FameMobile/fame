//
//  SYJBaseViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/22/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class SYJResumeViewController: BaseViewController {
    override func childViewController() -> BaseViewController? { return ResumeViewController() }
    
    override func rightBarButtonItem() -> UIBarButtonItem? {
        return UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(self.submit))
    }
    
    func submit() {
        self.complete?(nil)
    }
}

class SYJAccountViewController: BaseViewController {
    override func childViewController() -> BaseViewController? { return AccountViewController() }
    override func rightBarButtonItem() -> UIBarButtonItem? {
        return UIBarButtonItem(title: "Sign Up", style: .done, target: self, action: #selector(self.submit))
    }
    
    func submit() {
        self.complete?(nil)
    }
}

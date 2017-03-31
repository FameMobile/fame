//
//  SYJBaseViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/22/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol SubmitProtocol {
    func submit()
}

class SYJBaseViewController: BaseViewController {
    
    let complete: (_ value: Any?) -> Void    
    
    init(viewTitle: String? = nil, complete: @escaping (_ value: Any?) -> Void) {
        self.complete = complete
        super.init(navigationTitle: "START YOUR JOURNEY", viewTitle: viewTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SYJResumeViewController: SYJBaseViewController, SubmitProtocol {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.add(childViewController: ResumeViewController())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(self.submit))
    }
    
    func submit() {
        self.complete(nil)
    }
}

class SYJAccountViewController: SYJBaseViewController, SubmitProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.add(childViewController: AccountViewController())
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Up", style: .done, target: self, action: #selector(self.submit))
    }
    
    func submit() {
        self.complete(nil)
    }
}

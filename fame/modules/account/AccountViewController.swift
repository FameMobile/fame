//
//  AccountViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/22/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController {
    init(navigationTitle: String? = nil) {
        super.init(navigationTitle: navigationTitle, viewTitle: "Account")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

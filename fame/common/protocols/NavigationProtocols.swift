//
//  NavigationProtocols.swift
//  fame
//
//  Created by Jeff Cohen on 3/31/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

protocol NavigationControllerChild {
    func navigationTitle() -> String?
    func childViewController() -> BaseViewController?
    func rightBarButtonItem() -> UIBarButtonItem?
    
    func setNavTitle(_ title: String?)
}

extension NavigationControllerChild where Self: UIViewController {
    func setNavTitle(_ title: String?) {
        if let title = title {
            if let _ = self.parent as? UINavigationController {
                self.navigationItem.titleView = UILabel(title: title)
            } else if let parent = self.parent as? NavigationControllerChild {
                parent.setNavTitle(title)
            }
        }
    }
}

extension NavigationControllerChild where Self: BaseViewController {
    init(viewTitle: String? = nil, complete: CompleteWithValue? = nil) {
        self.init()
        self.title = viewTitle
        self.complete = complete
    }
}

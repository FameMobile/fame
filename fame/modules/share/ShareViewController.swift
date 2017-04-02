//
//  ShareViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/24/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit



class ShareViewController: BaseViewController {
    
    var delegate: DismissDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    func dismissSelf() {
        _ = self.navigationController?.popViewController(animated: true)
        //self.delegate?.didDismiss()
    }
}

// MARK - NavigationControllerChild
extension ShareViewController {
    override func navigationTitle() -> String? { return "SHARE" }
    
    override func rightBarButtonItem() -> UIBarButtonItem? {
        return UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.dismissSelf))
    }
}

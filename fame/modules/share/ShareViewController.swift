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
    
    init() {
        super.init(navigationTitle: "SHARE", viewTitle: "Share")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.dismissSelf))
    }
    
    func dismissSelf() {
        _ = self.navigationController?.popViewController(animated: true)
        //self.delegate?.didDismiss()
    }
}

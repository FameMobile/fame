//
//  RoleSplitterViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/20/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class SYJRoleViewController: UIViewController {

    @IBOutlet weak var artistButton: UIButton!
    @IBOutlet weak var fanButton: UIButton!
    
    let complete: (_ role: Role) -> Void
    
    required init(complete: @escaping (_ role: Role) -> Void) {
        self.complete = complete
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    @IBAction func routeArtist(_ sender: UIButton) {
        self.complete(Role.artist)
    }
    
    @IBAction func routeFan(_ sender: UIButton) {
        self.complete(Role.fan)
    }

}

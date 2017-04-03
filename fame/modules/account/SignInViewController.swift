//
//  SignInViewController.swift
//  fame
//
//  Created by Jeff Cohen on 4/1/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class SignInViewController: BaseViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var syjButton: UIButton!
    var startYourJourney: SYJStateMachine?
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hide()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.show()
    }
    
    @IBAction func signIn(_ sender: UIButton) {
        self.navigationController?.pushViewController(MainTabBarController(), animated: true)
    }
    
    @IBAction func startYourJourney(_ sender: UIButton) {
        if let navCtrl = self.navigationController {
            self.startYourJourney = SYJStateMachine()
            self.startYourJourney?.delegate = self
            self.startYourJourney?.start(from: navCtrl)
        }
    }
}

extension SignInViewController: DismissDelegate {
    func dismiss() {
        self.startYourJourney = nil
    }
}

//
//  StartYourJourneyStateMachine.swift
//  fame
//
//  Created by Jeff Cohen on 3/21/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class SYJStateMachine: DismissDelegate {
    
    var delegate: DismissDelegate?
    var user = User()
    var navigationController: UINavigationController?
    
    var isArtist: Bool {
        get{
            return self.user.role == Role.artist
        }
    }
    
    init() {}
    
    func pushViewController(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func start(from navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.presentRole()
    }
    
    fileprivate func presentRole() -> Void {
        self.pushViewController(SYJRoleViewController(viewTitle: "Role", complete: self.handleRole))
    }
    
    fileprivate func presentResume() {
        self.pushViewController(SYJResumeViewController(complete: self.handleResume))
    }
    
    fileprivate func presentAccount() {
        self.pushViewController(SYJAccountViewController(complete: self.handleAccount))
    }
    
    fileprivate func save() {
        self.dismiss()
    }
    
    fileprivate func presentShare() {
        let shareViewController = ShareViewController()
        shareViewController.delegate = self
        self.pushViewController(shareViewController)
    }
    
    func dismiss() {
        self.navigationController?.setViewControllers([MainViewController(), ShareViewController()], animated: true)
        self.delegate?.dismiss()
    }
}

extension SYJStateMachine {
    func handleRole(value: Any?) {
        self.user.role = value as? Role
        self.presentResume()
    }
    
    func handleResume(value: Any?) {
        self.presentAccount()
    }
    
    func handleAccount(value: Any?) {
        self.save()
    }
}


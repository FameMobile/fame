//
//  StartYourJourneyStateMachine.swift
//  fame
//
//  Created by Jeff Cohen on 3/21/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class SYJStateMachine {
    var user = UserModel()
    var navigationController: UINavigationController?
    
    var isArtist: Bool {
        get{
            return user.role == Role.artist
        }
    }
    
    init() {}
    
    func pushViewController(_ viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func start(from presentingViewController: UIViewController) {
        let roleVC = SYJRoleViewController(complete: self.handleRoleSelection)
        let navCon: UINavigationController = UINavigationController(rootViewController: roleVC)
        
        let navBar = navCon.navigationBar
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        navBar.tintColor = Color.golden.uiColor
        
        self.navigationController = navCon
        presentingViewController.present(navCon, animated: false, completion: nil)
    }
    
    fileprivate func presentInterests() {
        self.pushViewController(SYJInterestsViewController(complete: self.handleInterestsSelection))
    }
    
    fileprivate func presentAccountDetails() {
        
    }
    
    fileprivate func presentProfile() {
        
    }
    
    fileprivate func complete() {
        
    }
}

extension SYJStateMachine {
    func handleRoleSelection(value: Any?) {
        self.user.role = value as? Role
        self.presentInterests()
    }
    
    func handleInterestsSelection(value: Any?) {
        self.user.interests = value as? [String]
        self.presentAccountDetails()
    }
    
    func handleAccountDetails(value: Any?) {
        if self.isArtist {
            self.presentProfile()
        } else {
            self.complete()
        }
    }
}

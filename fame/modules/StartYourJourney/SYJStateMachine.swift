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
    
    func start(from presentingViewController: UIViewController) {
        let roleVC = SYJRoleViewController { [weak self] role in
            self?.handleRoleSelection(role: role)
        }
        
        let navCon: UINavigationController = UINavigationController(rootViewController: roleVC)
        navCon.navigationItem.titleView = self.titleView()
        
        let navBar = navCon.navigationBar
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
        
        self.navigationController = navCon
        presentingViewController.present(navCon, animated: true, completion: nil)
    }
    
    fileprivate func titleView() -> UIView {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.textColor = Color.golden.uiColor
        titleLabel.text = "START YOUR JOURNEY"
        titleLabel.font = UIFont.systemFont(ofSize: 14.0)
        titleLabel.layoutIfNeeded()
        titleLabel.sizeToFit()
        titleLabel.translatesAutoresizingMaskIntoConstraints = true
        
        return titleLabel
    }
    
    fileprivate func presentInterests() {
        self.navigationController?.pushViewController(SYJInterestsViewController(), animated: true)
    }
    
    fileprivate func presentAccountDetails() {
        
    }
    
    fileprivate func presentProfile() {
        
    }
    
    fileprivate func complete() {
        
    }
}

extension SYJStateMachine {
    func handleRoleSelection(role: Role) {
        self.user.role = role
        self.presentInterests()
    }
    
    private func handleInterestSelection(interests: [String]) {
        self.user.interests = interests
        self.presentAccountDetails()
    }
    
    private func handleAccountDetails() {
        if self.isArtist {
            self.presentProfile()
        } else {
            self.complete()
        }
    }
}

//
//  MainTabBarController.swift
//  fame
//
//  Created by Jeff Cohen on 3/24/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        self.tabBar.barStyle = .black
        self.tabBar.isTranslucent = false
        self.tabBar.unselectedItemTintColor = Color.grayDark.uiColor
        self.tabBar.tintColor = Color.gray.uiColor
        
        self.viewControllers = self.createTabs()
        
        self.tabBar.addDefaultSeparators()
        
        let logo = UIBarButtonItem(image: #imageLiteral(resourceName: "logo"), style: .plain, target: self, action: #selector(self.logout))
        logo.tintColor = Color.white.uiColor
        self.navigationItem.leftBarButtonItem = logo
        
        // Make sure view controller starts below the navigation bar
        self.edgesForExtendedLayout = UIRectEdge()
    }
 
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.edgesForExtendedLayout = []
    }
    
    func createTabs() -> [UIViewController] {
        return [
            RTFViewController().withDefaultItem(),
            DiscoverViewController().withDefaultItem(),
            TrendingViewController().withDefaultItem()
        ]
    }
    
    func logout() {
        self.navigationController?.setViewControllers([SignInViewController()], animated: true)
    }
}

extension MainTabBarController: NavigationControllerChild {
    func navigationTitle() -> String? { return nil }
    
    func childViewController() -> BaseViewController? {
        return nil
    }
    
    func rightBarButtonItem() -> UIBarButtonItem? {
        return nil
    }
}

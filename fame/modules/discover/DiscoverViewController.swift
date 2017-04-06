//
//  DiscoverViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit
import Koloda

class DiscoverViewController: BaseViewController {
    
    @IBOutlet weak var artistCard: KolodaView!
    @IBOutlet weak var artistHeader: UIView!
    @IBOutlet weak var stageNameLabel: UILabel!
    @IBOutlet weak var nameLocationSeparator: UIView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var artistImage: UIImageView!
    @IBOutlet weak var replayButton: UIImageView!
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var voteFooter: UIView!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var top20Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.moreButton.tintColor = Color.golden.uiColor
        
        self.nameLocationSeparator.backgroundColor = UIView.defaultBorderColor.uiColor
        
        self.rejectButton.style()
        self.likeButton.style()
        self.top20Button.style()
    }
    
    fileprivate func styleSeparator() {
        guard let separator = self.nameLocationSeparator else {
            return
        }
        separator.backgroundColor = UIView.defaultBorderColor.uiColor
        separator.frame.size = CGSize(width: self.view.frame.width * 0.75, height: UIView.defaultBorderThickness)
        
    }
}

// MARK - NavigationControllerChild
extension DiscoverViewController {
    override func navigationTitle() -> String? { return "DISCOVER" }
}

// MARK - Tab
extension DiscoverViewController: Tab {
    var defaultTabBarItem: UITabBarItem? {
        get {
            return UITabBarItem(title: nil, image: #imageLiteral(resourceName: "resume"), tag: 1)
        }
    }
}

// MARK - Button Extension
fileprivate extension UIButton {
    func style() {
        //self.imageEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 15)
        self.backgroundColor = Color.purpleLight.uiColor
        self.tintColor = Color.golden.uiColor
        self.makeCircular()
    }
}


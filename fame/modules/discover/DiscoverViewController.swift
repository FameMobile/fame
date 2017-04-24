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
    
    @IBOutlet weak var artistDeckView: KolodaView!
    
    @IBOutlet weak var voteFooterView: UIView!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var top20Button: UIButton!
    
    var artists: [Artist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rejectButton.style()
        self.likeButton.style()
        self.top20Button.style()
        
        self.populateArtists()
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        
        self.setupKolodaView()
    }
    
    func populateArtists() {
        self.artists = FakeData.artists
    }
    
    @IBAction func reject(_ sender: UIButton) {
        self.artistDeckView.swipe(.left)
    }
    @IBAction func like(_ sender: UIButton) {
        self.artistDeckView.swipe(.right)
    }
    @IBAction func top20(_ sender: UIButton) {
        self.artistDeckView.swipe(.up)
    }
}

private let frameAnimationSpringBounciness: CGFloat = 9
private let frameAnimationSpringSpeed: CGFloat = 16
private let kolodaCountOfVisibleCards = 2
private let kolodaAlphaValueSemiTransparent: CGFloat = 0.1

// MARK - Setup Koloda
extension DiscoverViewController {
    func setupKolodaView() {
        self.artistDeckView.alphaValueSemiTransparent = kolodaAlphaValueSemiTransparent
        self.artistDeckView.countOfVisibleCards = kolodaCountOfVisibleCards
        self.artistDeckView.delegate = self
        self.artistDeckView.dataSource = self
        //self.artistStackView.animator = BackgroundKolodaAnimator(koloda: kolodaView)
    }
}

// MARK - KolodaViewDelegate
extension DiscoverViewController: KolodaViewDelegate {
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        return [.left, .up, .right]
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        self.artistDeckView.resetCurrentCardIndex()
    }    
}

// MARK - KolodaViewDataSource
extension DiscoverViewController: KolodaViewDataSource {
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .moderate
    }

    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return self.artists.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        
        return ArtistCardView(artist: self.artists[index])
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return nil//Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
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
        self.contentMode = .center
        self.makeCircular()
    }
}


//
//  DiscoverViewController.swift
//  fame
//
//  Created by Jeff Cohen on 3/30/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit
import Koloda
import MobilePlayer

class DiscoverViewController: BaseViewController {
    
    @IBOutlet weak var artistDeckView: KolodaView!
    
    @IBOutlet weak var voteFooterView: UIView!
    @IBOutlet weak var rejectButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var top20Button: UIButton!
    
    var mobilePlayerViewController: MobilePlayerViewController?
    
    var artists: [Artist] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rejectButton.style()
        self.likeButton.style()
        self.top20Button.style()
        
        self.populateArtists()
        
        self.modalTransitionStyle = .flipHorizontal
        
        self.setupKolodaView()
    }
    
    func populateArtists() {
        self.artists = FakeData.artists
    }
    
    @IBAction func reject(_ sender: UIButton) {
        self.simulateSwipe(.left)
    }
    @IBAction func like(_ sender: UIButton) {
        self.simulateSwipe(.right)
    }
    @IBAction func top20(_ sender: UIButton) {
        self.simulateSwipe(.up)
    }
    
    func simulateSwipe(_ direction: SwipeResultDirection) {
        if let playerVC = self.mobilePlayerViewController {
            playerVC.dismiss(animated: true) {
                self.artistDeckView.swipe(direction)
            }
        } else {
            self.artistDeckView.swipe(direction)
        }
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
        let artistCard = ArtistCardView(artist: self.artists[index])
        artistCard.videoDelegate = self
        return artistCard
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
            return UITabBarItem(title: nil, image: #imageLiteral(resourceName: "discover"), tag: 1)
        }
    }
}

let videoPlayerSkinning: [String : Any] = [:]

// MARK - VideoPlayerDelegate
extension DiscoverViewController: VideoPlayerDelegate {
    func display() {
        let videoURL = URL(fileReferenceLiteralResourceName: "code_walk_through.mp4")
        
        let playerVC = VideoPlayerViewController(contentURL: videoURL)
        playerVC.title = "ELIAH HUNT - Teaching Programming"
        playerVC.activityItems = [videoURL]        
        playerVC.modalTransitionStyle = .crossDissolve
        playerVC.modalPresentationStyle = .popover
        playerVC.modalPresentationCapturesStatusBarAppearance = false
        if let popoverVC = playerVC.popoverPresentationController {
            let coverImageView = (self.artistDeckView.viewForCard(at: self.artistDeckView.currentCardIndex) as? ArtistCardView)?.coverImageView
            popoverVC.delegate = self
            popoverVC.backgroundColor = Color.clear.uiColor
            popoverVC.passthroughViews = [self.rejectButton, self.likeButton, self.top20Button]
            popoverVC.permittedArrowDirections = []            
            popoverVC.sourceView = coverImageView
            popoverVC.sourceRect = coverImageView?.bounds ?? self.view.bounds
        }
        
        self.present(playerVC, animated: true, completion: nil)
        self.mobilePlayerViewController = playerVC
    }
}

extension DiscoverViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
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

fileprivate class VideoPlayerViewController: MobilePlayerViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayStatusBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        displayStatusBar()
    }
    
    private func displayStatusBar() {
        UIApplication.shared.isStatusBarHidden = false
        setNeedsStatusBarAppearanceUpdate()
    }
}


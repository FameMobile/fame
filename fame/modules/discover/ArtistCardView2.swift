//
//  ArtistCardView.swift
//  fame
//
//  Created by Jeff Cohen on 4/7/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit
import PureLayout

class ArtistCardView: UIView {
    
    var artist: Artist?
    
    var headerView: UIView = UIView.newClearAutoLayout()
    var stageNameView: UIView = UIView.newClearAutoLayout()
    
    var resumeImageView: UIImageView = UIImageView.newAutoLayout()
    var stageNameLabel: UILabel = UILabel.newAutoLayout()
    var headerSeparator: UIView = UIView.border()
    var professionLocationLabel: UILabel = UILabel.newAutoLayout()
    
    var coverImageView: UIImageView = UIImageView.newAutoLayout()
    
    var replayButton: UIButton = UIButton.newAutoLayout()
    var moreDetailButton: UIButton = UIButton.newAutoLayout()
    
    var resume: Resume {
        return self.artist?.resume ?? Resume()
    }
    
    init(artist: Artist?) {
        super.init(frame: CGRect())
        
        self.artist = artist
        
        self.buildView()
        self.populate()
        self.layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK - Elements
extension ArtistCardView {
    fileprivate func buildView() {
        buildHeaderView()
        
        self.addSubviews([
            self.headerView,
            self.coverImageView,
            self.replayButton,
            self.moreDetailButton])
    }
    
    fileprivate func buildHeaderView() {
        self.stageNameView.addSubviews([self.resumeImageView, self.stageNameLabel])
        
        self.headerView.addSubviews([
            self.stageNameView,
            self.headerSeparator,
            self.professionLocationLabel])
    }
}

// MARK - Layout
extension ArtistCardView {
    
    fileprivate func layout() {
        self.backgroundColor = Color.purple.uiColor
        self.clipsToBounds = true
        //self.layoutIfNeeded()
        
        layoutHeaderView()
        layoutCoverImageView()
        layoutMoreDetailButton()
        layoutReplayButton()
    }
    
    func layoutHeaderView() {
        self.headerView.autoPinEdge(toSuperviewEdge: .top, withInset: 10)
        self.headerView.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        self.headerView.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        
        layoutStageNameView()
        layoutHeaderSeparator()
        layoutProfessionLocationLabel()
    }
    
    fileprivate func layoutStageNameView() {
        self.stageNameView.autoAlignAxis(toSuperviewAxis: .vertical)
        self.stageNameView.autoPinEdge(toSuperviewEdge: .top)
        
        layoutResumeImageView()
        layoutStageNameLabel()
    }
    
    fileprivate func layoutResumeImageView() {
        let view = self.resumeImageView
        view.image = #imageLiteral(resourceName: "resume")
        view.tintColor = Color.gray.uiColor
        view.autoSetDimensions(to: CGSize(width: 16, height: 16))        
        view.autoPinEdge(toSuperviewEdge: .leading)
        view.autoAlignAxis(.horizontal, toSameAxisOf: self.stageNameLabel)
    }
    
    fileprivate func layoutStageNameLabel() {
        let label = self.stageNameLabel
        label.font = BasicSans.regular.font(ofSize: 23)
        label.textColor = Color.white.uiColor
        label.autoPinEdge(.leading, to: .trailing, of: self.resumeImageView, withOffset: 10)
        label.autoPinEdge(toSuperviewEdge: .top)
        label.autoPinEdge(toSuperviewEdge: .trailing)
        label.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    fileprivate func layoutHeaderSeparator() {
        let separator = self.headerSeparator
        separator.autoAlignAxis(toSuperviewAxis: .vertical)
        separator.autoSetDimension(.height, toSize: UIView.defaultBorderThickness)
        separator.autoMatch(.width, to: .width, of: separator.superview ?? self, withMultiplier: 0.75)
        separator.autoPinEdge(.top, to: .bottom, of: self.stageNameView, withOffset: 5)
    }
    
    fileprivate func layoutProfessionLocationLabel() {
        let label = self.professionLocationLabel
        label.font = BasicSans.regular.font(ofSize: 13)
        label.textColor = Color.white.uiColor
        label.autoAlignAxis(toSuperviewAxis: .vertical)
        label.autoPinEdge(.top, to: .bottom, of: self.headerSeparator, withOffset: 5)
        label.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
    fileprivate func layoutCoverImageView() {
        let view = self.coverImageView
        view.contentMode = .scaleAspectFit
        view.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        view.autoPinEdge(toSuperviewEdge: .trailing, withInset: 10)
        view.autoPinEdge(.top, to: .bottom, of: self.headerView, withOffset: 10)
        view.autoConstrainAttribute(.height, to: .width, of: view, withOffset: 0, relation: .lessThanOrEqual)
    }
    
    fileprivate func layoutMoreDetailButton() {
        let button = self.moreDetailButton
        button.titleLabel?.font = BasicSans.regular.font(ofSize: 15)
        button.setTitleColor(Color.golden.uiColor, for: .normal)
        button.autoAlignAxis(toSuperviewAxis: .vertical)
        button.autoPinEdge(.top, to: .bottom, of: self.coverImageView, withOffset: 10)
    }
    
    fileprivate func layoutReplayButton() {
        let button = self.replayButton
        button.setImage(#imageLiteral(resourceName: "replay"), for: .normal)
        button.autoPinEdge(toSuperviewEdge: .leading, withInset: 10)
        button.autoAlignAxis(.horizontal, toSameAxisOf: self.moreDetailButton)
    }
}

// MARK - Populate
extension ArtistCardView {
    fileprivate func populate() {
        let stageName = self.resume.stageName ?? ""
        self.stageNameLabel.text = stageName
        self.professionLocationLabel.text = self.resume.professionInLocation
        
        self.coverImageView.image = self.resume.headShot
        
        let moreDetailText = stageName.isEmpty ? "more detail" : "more from \(stageName)"
        self.moreDetailButton.setTitle(moreDetailText, for: .normal)
    }
}

fileprivate extension UIView {
    static func newClearAutoLayout() -> Self {
        let view = self.newAutoLayout()
        view.backgroundColor = Color.clear.uiColor
        return view
    }
}

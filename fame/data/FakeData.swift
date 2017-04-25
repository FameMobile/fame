//
//  FakeData.swift
//  fame
//
//  Created by Jeff Cohen on 4/6/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

class FakeData {
    static let eliah = Artist(resume: Resume(
        headShot: #imageLiteral(resourceName: "eliah"),
        stageName: "ELIAH HUNT",
        username: "eliah",
        profession: .singer,
        location: Location(city: "Atlanta", state: "GA"),
        genre: "Blues",
        headline: "Just trying to do my thing.",
        introVideo: nil,
        portfolio: nil,
        urls: nil)
    )
    
    static let micah = Artist(resume: Resume(
        headShot: #imageLiteral(resourceName: "micah"),
        stageName: "MICAH",
        username: "micah",
        profession: .comedian,
        location: Location(city: "Los Angeles", state: "CA"),
        genre: "Comedy",
        headline: "Next...world domination",
        introVideo: nil,
        portfolio: nil,
        urls: nil)
    )
    
    static let elan = Artist(resume: Resume(
        headShot: #imageLiteral(resourceName: "elan"),
        stageName: "elan",
        username: "elan",
        profession: .dancer,
        location: Location(city: "Woodmere", state: "NY"),
        genre: "Hip Hop",
        headline: "Lookin' cute",
        introVideo: nil,
        portfolio: nil,
        urls: nil)
    )
    
    static let jeff = Artist(resume: Resume(
        headShot: #imageLiteral(resourceName: "jeff"),
        stageName: "JCo",
        username: "jeff",
        profession: .musician,
        location: Location(city: "Chicago", state: "IL"),
        genre: "Acoustic",
        headline: "Chillin' by the fire",
        introVideo: nil,
        portfolio: nil,
        urls: nil)
    )
    
    static var artists: [Artist] {
        return [eliah, micah, elan, jeff]
    }
}

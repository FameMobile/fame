//
//  Resume.swift
//  fame
//
//  Created by Jeff Cohen on 4/6/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

struct Resume {
    var headShot: UIImage?
    var stageName: String?
    var username: String?
    var profession: Profession?
    var location: Location?
    var genre: String?
    var headline: String?
    
    var introVideo: Any?
    var portfolio: [Any]?
    
    var urls: [String]?
    
    var professionInLocation: String {
        return [self.profession?.rawValue, self.location?.displayText]
            .flatMap { $0 }
            .joined(separator: " in ")
            .uppercased()
    }
}

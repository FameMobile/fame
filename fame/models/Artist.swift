//
//  Artist.swift
//  fame
//
//  Created by Jeff Cohen on 4/6/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import UIKit

struct Artist {
    var resume: Resume
    var rank: ArtistRank
    
    init(resume: Resume = Resume(), rank: ArtistRank = ArtistRank()) {
        self.resume = resume
        self.rank = rank
    }        
}

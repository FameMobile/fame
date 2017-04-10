//
//  ArtistRank.swift
//  fame
//
//  Created by Jeff Cohen on 4/6/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import Foundation

class ArtistRank {
    var upVotes: Int = 0
    var downVotes: Int = 0
    var top20Votes: Int = 0
    
    var totalPositiveVotes: Int {
        return upVotes + top20Votes
    }
    
    var totalVotes: Int {
        return totalPositiveVotes + downVotes
    }
}

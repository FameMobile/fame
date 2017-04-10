//
//  Location.swift
//  fame
//
//  Created by Jeff Cohen on 4/6/17.
//  Copyright © 2017 Fame. All rights reserved.
//

import Foundation

struct Location {
    var city: String?
    var state: String?
    var country: String?
    var postalCode: String?
    
    init(city: String, state: String) {
        self.city = city
        self.state = state
    }
    
    var displayText: String {
        return [self.city, self.state]
            .flatMap { $0 }
            .joined(separator: ", ")
    }
}

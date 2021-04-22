//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Milovan Tomašević on 08/08/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import Foundation

struct Story {
    let storyTitle: String
    let choice1: String
    let choice1Destination: Int
    let choice2: String
    let choice2Destination: Int
    
    init(title: String, choice1: String, choice1Destination: Int, choice2: String, choice2Destination: Int) {
        storyTitle = title
        self.choice1 = choice1
        self.choice1Destination = choice1Destination
        self.choice2 = choice2
        self.choice2Destination = choice2Destination
    }
}

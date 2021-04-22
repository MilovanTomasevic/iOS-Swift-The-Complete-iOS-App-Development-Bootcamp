//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Milovan Tomašević on 09/06/20.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    
    //Multiple choice questions have multiple answers, an Array of Strings would work for our quiz data.
    let answer: [String]
    //Look at the data in the quiz array, there is a seperate string that is the correctAnswer.
    let rightAnswer: String

    //The initialiser needs to be updated to match the new multiple choice quiz data.
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        rightAnswer = correctAnswer
    }
}

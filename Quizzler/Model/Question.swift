//
//  Question.swift
//  Quizzler
//
//  Created by Joao daniel on 21/12/21.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(text: String, answer: String) {
        self.text = text
        self.answer = answer
    }
}

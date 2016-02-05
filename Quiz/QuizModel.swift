//
//  Question.swift
//  Quiz
//
//  Created by Gabe Remote Office on 1/18/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

class QuizModel {
    var questions: [String] = []
    var answers: [String] = []
    var currentQuestionIndex: Int = 0
    var currentQuestion: String {
        return questions[currentQuestionIndex]
    }
    var currentAnswer: String {
        return answers[currentQuestionIndex]
    }
    
    init() {
        questions.append("From what is cognac made?")
        answers.append("Grapes")
        
        questions.append("What is 7 + 7?")
        answers.append("14")
        
        questions.append("What is the capital of Vermont?")
        answers.append("Montpelier")
    }
    
    func next() -> Int {
        // Go to the next question or return to the beginning
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            // Loop back to the begining
            currentQuestionIndex = 0
            return currentQuestionIndex
        } else {
            // return next question
            return currentQuestionIndex
        }
    }
    
    func previous() -> Int {
        // Go to the next question or return to the beginning
        currentQuestionIndex -= 1
        if currentQuestionIndex < 0 {
            // Loop back to the end
            currentQuestionIndex = questions.count - 1
            return currentQuestionIndex
        } else {
            // return previous question
            return currentQuestionIndex
        }
    }
}
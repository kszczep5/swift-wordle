//
//  Model.swift
//  swift-wordle
//
//  Created by Kacper on 17/11/2022.
//

import Foundation

class Model {
    
    private var correctAnswer: Answer
    private(set) var answers: [Answer]
    
    init(
        correctAnswer: Answer = .init(elements: [.init("1"), .init("2"), .init("3"), .init("4"), .init("5")]),
        answers: [Answer] = []
    ) {
        self.correctAnswer = correctAnswer
        self.answers = answers
    }
    
    var rowIndex = 0
    var position = 0
     
    func changePosition(to newPosition: Int) {
        position = newPosition
    }
    
    func check(_ answer: Answer, completionHandler: @escaping (Int, Answer) -> Void) {
        var checkedAnswer = Answer()
        for index in answer.elements.indices {
            if correctAnswer.contains(answer[index]) {
                checkedAnswer.elements.append(
                    .init(
                        answer[index].value,
                        validation: correctAnswer[index].value == answer[index].value ? .presentButIncorrectPosition : .correctPosition
                    )
                )
            } else {
                checkedAnswer.elements.append(.init(answer[index].value))
            }
        }
        answers.append(checkedAnswer)
        completionHandler(rowIndex, checkedAnswer)
        rowIndex += 1
        position = 0
    }
    
    
    func newGame(withCorrectAnswer answer: Answer = .random) {
        correctAnswer = answer
        rowIndex = 0
        answers = []
    }
    
}

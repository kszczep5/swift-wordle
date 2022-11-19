import Foundation

struct Answer {
    var elements: [Element]
    
    init(elements: [Element] = []) {
        self.elements = Answer.adjustNumberOfElements(elements: elements)
    }
    
    func contains(_ element: Element) -> Bool {
        elements.contains{ $0.value == element.value }
    }
    
    subscript(index: Int) -> Element {
        get { elements[index] }
        set(newValue) { elements[index] = newValue }
    }
    
    struct Element {
        let value: String
        var validation: Validation
        
        init(_ value: String, validation: Validation = .none) {
            self.value = value
            self.validation = validation
        }
        
        enum Validation {
            case none, presentButIncorrectPosition, correctPosition
        }
    }
}

extension Answer {
    static var random: Answer {
        var elements: [Element] = []
        for _ in 0 ..< WordleRules.wordSize {
            let randomNumber = String(Int.random(in: WordleRules.valueRange))
            elements.append(.init(randomNumber))
        }
        return .init(elements: elements)
    }
    
    private static func adjustNumberOfElements(elements: [Element]) -> [Element] {
        guard elements.count == WordleRules.wordSize else { return elements }
        var result = elements
        let count = elements.count
        if count < WordleRules.wordSize {
            for _ in 0 ..< WordleRules.wordSize - count {
                result.append(.init(""))
            }
        } else {
            result.removeLast(count - WordleRules.wordSize)
        }
        return result
    }
}

//
//  ViewController.swift
//  swift-wordle
//
//  Created by Kacper on 17/11/2022.
//

import Cocoa

class ViewController: NSViewController {
    
    private let model: Model = Model()
    
    @IBOutlet weak var label1: NSTextField!
    @IBOutlet weak var label2: NSTextField!
    @IBOutlet weak var label3: NSTextField!
    @IBOutlet weak var label4: NSTextField!
    @IBOutlet weak var label5: NSTextField!
    @IBOutlet weak var label6: NSTextField!
    @IBOutlet weak var label7: NSTextField!
    @IBOutlet weak var label8: NSTextField!
    @IBOutlet weak var label9: NSTextField!
    @IBOutlet weak var label10: NSTextField!
    @IBOutlet weak var label11: NSTextField!
    @IBOutlet weak var label12: NSTextField!
    @IBOutlet weak var label13: NSTextField!
    @IBOutlet weak var label14: NSTextField!
    @IBOutlet weak var label15: NSTextField!
    @IBOutlet weak var label16: NSTextField!
    @IBOutlet weak var label17: NSTextField!
    @IBOutlet weak var label18: NSTextField!
    @IBOutlet weak var label19: NSTextField!
    @IBOutlet weak var label20: NSTextField!
    @IBOutlet weak var label21: NSTextField!
    @IBOutlet weak var label22: NSTextField!
    @IBOutlet weak var label23: NSTextField!
    @IBOutlet weak var label24: NSTextField!
    @IBOutlet weak var label25: NSTextField!
    @IBOutlet weak var label26: NSTextField!
    @IBOutlet weak var label27: NSTextField!
    @IBOutlet weak var label28: NSTextField!
    @IBOutlet weak var label29: NSTextField!
    @IBOutlet weak var label30: NSTextField!
    @IBOutlet weak var label31: NSTextField!
    @IBOutlet weak var label32: NSTextField!
    @IBOutlet weak var label33: NSTextField!
    @IBOutlet weak var label34: NSTextField!
    @IBOutlet weak var label35: NSTextField!
    @IBOutlet weak var label36: NSTextField!
    @IBOutlet weak var label37: NSTextField!
    @IBOutlet weak var label38: NSTextField!
    @IBOutlet weak var label39: NSTextField!
    @IBOutlet weak var label40: NSTextField!
    @IBOutlet weak var newGameButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func positionKeyPressed(_ sender: NSButton) {
        model.changePosition(to: sender.tag)
    }
    
    @IBAction func numberKeyPressed(_ sender: NSButton) {
        textFields(forRowAt: model.rowIndex)[model.position].stringValue = sender.title
    }
    
    private func changeLabel(_ numbers: [String],_ pos: Int){
        textFields(forRowAt: model.rowIndex)[model.position].stringValue = numbers[pos]
    }
    
    @IBAction func checkPressed(_ sender: NSButton) {
        let activeTextFields = textFields(forRowAt: model.rowIndex)
        let answer = Answer(elements: [
            .init(activeTextFields[0].stringValue),
            .init(activeTextFields[1].stringValue),
            .init(activeTextFields[2].stringValue),
            .init(activeTextFields[3].stringValue),
            .init(activeTextFields[4].stringValue)
        ])
        model.check(answer) { [unowned self] rowIndex, checkedAnswer in
            self.textFields(forRowAt: rowIndex)
                .enumerated()
                .forEach { index, textField in
                    updateBackgroundColor(of: textField, basedOn: checkedAnswer[index].validation)
                }
        }
    }
    
    private func updateBackgroundColor(of textField: NSTextField, basedOn validation: Answer.Element.Validation){
        switch validation {
        case .presentButIncorrectPosition:
            textField.backgroundColor = .orange
        case .correctPosition:
            textField.backgroundColor = .green
        case .none:
            textField.backgroundColor = .white
        }
    }
    
    @IBAction func newGamePressed(_ sender: NSButton) {
        model.newGame()
        resetTextFields()
    }
    
    private func resetTextFields() {
        for rowIndex in 0 ..< 8 {
            textFields(forRowAt: rowIndex)
                .forEach {
                    $0.backgroundColor = .white
                    $0.stringValue = ""
                }
        }
    }
    
    private func textFields(forRowAt rowIndex: Int) -> [NSTextField] {
        switch rowIndex {
        case 0: return [label1, label2, label3, label4, label5]
        case 1: return [label6, label7, label8, label9, label10]
        case 2: return [label11, label12, label13, label14, label15]
        case 3: return [label16, label17, label18, label19, label20]
        case 4: return [label21, label22, label23, label24, label25]
        case 5: return [label26, label27, label28, label29, label30]
        case 6: return [label31, label32, label33, label34, label35]
        case 7: return [label36, label37, label38, label39, label40]
        default: fatalError("Row not supported at index: \(rowIndex)")
        }
    }
    
}

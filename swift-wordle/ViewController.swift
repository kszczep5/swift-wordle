//
//  ViewController.swift
//  swift-wordle
//
//  Created by Kacper on 17/11/2022.
//

import Cocoa

class ViewController: NSViewController {

    var model: Model = Model()
    
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
    
    var labels: [NSTextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newVerse(model.verse)
        
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "updateScreen"),
            object: nil,
            queue: nil
        ) { (notification: Notification) -> Void in
            self.changeLabel(self.model.answer, self.model.position)
            }
        
        
        NotificationCenter.default.addObserver(
            forName: NSNotification.Name(rawValue: "updateColor"),
            object: nil,
            queue: nil
        ) { (notification: Notification) -> Void in
            self.changeLabelColor()
            self.newVerse(self.model.verse)
            self.model.position = 0
            }
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func positionKeyAction(_ sender: NSButton) {
        model.changePos(sender.tag)
    }
    
    @IBAction func numberKeyAction(_ sender: NSButton) {
        model.numberBuild(sender.title)
    }
    
    func changeLabel(_ numbers: [String],_ pos: Int){
        
        labels[pos].stringValue = numbers[pos]
    }
    
    @IBAction func checkPress(_ sender: NSButton) {
        model.check()
    }
    
    func changeLabelColor(){
        var i = 0
        for label in labels {
            if(model.yellow[i] != ""){
                label.backgroundColor = .systemOrange
            }
            if (model.green[i] != "") {
                label.backgroundColor = .systemGreen
            }
            i+=1
        }
    }
    
    @IBAction func newGame(_ sender: NSButton) {
        model.newGame()
        for i in 0...7 {
            newVerse(i)
            for label in labels {
                label.backgroundColor = .white
                label.stringValue = ""
            }
        }
        newVerse(model.verse)
        model = Model()
    }
    
    func newVerse(_ verse: Int){
        switch verse{
        case 0: labels = [label1, label2, label3, label4, label5]
        case 1: labels = [label6, label7, label8, label9, label10]
        case 2: labels = [label11, label12, label13, label14, label15]
        case 3: labels = [label16, label17, label18, label19, label20]
        case 4: labels = [label21, label22, label23, label24, label25]
        case 5: labels = [label26, label27, label28, label29, label30]
        case 6: labels = [label31, label32, label33, label34, label35]
        case 7: labels = [label36, label37, label38, label39, label40]
        default:
            labels = [label1, label2, label3, label4, label5]
            model.verse = 0
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.newGame(self.newGameButton)
            }
            
        }
    }
    
    
    
}



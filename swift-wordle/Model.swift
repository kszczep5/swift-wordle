//
//  Model.swift
//  swift-wordle
//
//  Created by Kacper on 17/11/2022.
//

import Foundation

class Model{
    
    private var goodAnswer = ["1", "2", "3", "4", "5"]
    
    var position = 0
    
    var verse = 0
    
    var answer = ["", "", "", "", ""]{
        didSet(newValue){
            let notificationCenter = NotificationCenter.default
            let notification = Notification(name: Notification.Name(rawValue: "updateScreen"), object: nil)
            notificationCenter.post(notification)
        }
    }
    
    var updateColor = 0{
        didSet(newValue){
            let notificationCenter = NotificationCenter.default
            let notification = Notification(name: Notification.Name(rawValue: "updateColor"), object: nil)
            notificationCenter.post(notification)
        }
    }
    
    
    var green = ["","","","",""]
    var yellow = ["","","","",""]
    
    init(){
        
        
    }
    
    func changePos(_ pos: Int){
        position = pos
    }
    
    func numberBuild(_ number: String){
        answer[position] = number
    }
    
    func check(){
        var i = 0
        for element in answer{
            if (goodAnswer.contains(element) && goodAnswer[i] != element) {
                yellow[i] = element
            } else if (goodAnswer.contains(element) && goodAnswer[i] == element){
                green[i] = element
            }
            i+=1
        }
        verse += 1
        updateColor = 1
        answer = ["", "", "", "", ""]
        green = ["", "", "", "", ""]
        yellow = ["", "", "", "", ""]
    }
    
    
    func newGame(){
        answer = ["", "", "", "", ""]
        green = ["", "", "", "", ""]
        yellow = ["", "", "", "", ""]
        verse = 0

    }
    
}

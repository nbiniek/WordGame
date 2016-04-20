//
//  AnswerField.swift
//  WordGame
//
//  Created by Noah Biniek on 4/20/16.
//  Copyright © 2016 NoahProjects. All rights reserved.
//

import UIKit

class AnswerField: UITextField, UITextFieldDelegate {
    
    let defaultText = ""
    
    var answer: String = ""
    var hintNum: Int = 0
    
    init(x: CGFloat, y: CGFloat, endField: Bool, answer: String) {
        super.init(frame: CGRect(x: x, y: y, width: 250, height: 30))
        
        self.answer = answer
        if(endField) {
            self.text = answer
        } else {
            self.text = defaultText
        }
        self.borderStyle = UITextBorderStyle.RoundedRect
        self.backgroundColor = UIColor.lightGrayColor()
        self.keyboardType = UIKeyboardType.Alphabet
        self.autocapitalizationType = UITextAutocapitalizationType.AllCharacters
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setNewAnswer(answer: String) {
        self.answer = answer
    }
    func addHintNum() -> Bool { // TO BE IMPLEMENTED: control hintNum so as to not exceed word length
        hintNum += 1
        return true
    }
    func getHint() -> String { // TO BE IMPLEMENTED: return more than one letter hint
        return String(answer[answer.startIndex])
    }
    func isCorrect() -> Bool {
        return self.text == self.answer
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        if(!isCorrect()) {
            textField.text = self.getHint()
        }
        return !isCorrect()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        if isCorrect() {
            print("correct")
        } else {
            self.addHintNum()
            textField.text = self.getHint()
            print("wrong")
        }
    }
}

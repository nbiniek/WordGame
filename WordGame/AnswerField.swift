//
//  AnswerField.swift
//  WordGame
//
//  Created by Noah Biniek on 4/20/16.
//  Copyright © 2016 NoahProjects. All rights reserved.
//

import UIKit

class AnswerField: UITextField, UITextFieldDelegate {
    
    var disabled: Bool = false
    var answer: String = ""
    var textShown: String = ""
    var hintNum: Int = 0
 
    
    init(x: CGFloat, y: CGFloat, topOrBottomField: Bool, answer: String) {
        super.init(frame: CGRect(x: x, y: y, width: 250, height: 30))
        
        // field logic setup //
        disabled = topOrBottomField
        self.answer = answer
        if topOrBottomField { textShown = answer }
        else { textShown = "" }
        self.text = textShown
        
        // style setup //
        self.borderStyle = UITextBorderStyle.RoundedRect
        self.backgroundColor = UIColor.lightGrayColor()
        
        // etc setup //
        self.keyboardType = UIKeyboardType.Alphabet
        self.autocapitalizationType = UITextAutocapitalizationType.AllCharacters
        self.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addHint() {
        hintNum += 1
        
        // substring range setup //
        let startIndex = answer.startIndex
        let endIndex = answer.endIndex.advancedBy(-(answer.characters.count-hintNum))
        let range = startIndex..<endIndex
        
        textShown = answer.substringWithRange( range )
    }
    
    func isCorrect() -> Bool {
        return self.text == self.answer
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // called when textField is touched //
        if !disabled {
            addHint()
            self.text = textShown
        }
        
        return !disabled
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // called when textField's return is touched //
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        // called when textField ends editing //
        if isCorrect() {
            disabled = true
        } else {
            self.text = textShown
        }
    }
}

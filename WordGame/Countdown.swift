//
//  Countdown.swift
//  WordGame
//
//  Created by Noah Biniek on 4/21/16.
//  Copyright © 2016 NoahProjects. All rights reserved.
//

import SpriteKit

class Countdown: SKNode {
    
    let countdownLabel = SKLabelNode(text: "Begin in: ")
    var label: String = ""
    var count: Int = 0
    
    init(screenSize: CGSize) {
        super.init()
        
        countdownLabel.fontName = "Arial"
        countdownLabel.fontSize = 12.0
        countdownLabel.position = CGPoint(x: screenSize.width * 0.5, y: screenSize.height * 0.6)
        countdownLabel.horizontalAlignmentMode = .Center
        countdownLabel.verticalAlignmentMode = .Center
    
        self.zPosition = 10
    }
    func countdown(count: Int, label: String?="Begin in: ") {
        self.count = count
        self.label = label!
        countdownLabel.text = self.label + "\(count)..."
        
        self.addChild(countdownLabel)
        
        let counterDecrement = SKAction.sequence([SKAction.waitForDuration(1.0),
            SKAction.runBlock(countdownAction)])
        
        runAction(SKAction.sequence([SKAction.repeatAction(counterDecrement, count: 5),
            SKAction.runBlock(endCountdown)]))
        
    }
    
    func countdownAction() {
        count-=1
        countdownLabel.text = label + "\(count)..."
    }
    
    func endCountdown() {
        countdownLabel.removeFromParent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}